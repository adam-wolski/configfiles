bl_info = {'name': 'Miniu tools',
        'description': 'Custom often used tools and scripts',
        'author': 'miniu',
        'version': (0, 4, 3),
        'blender': (2,71,0),
        'category': 'Mine',
        }


import bpy

class MainCustomMenu(bpy.types.Menu):
    bl_idname = 'OBJECT_MT_MainCustomMenu'
    bl_label = "My Main Custom Menu"

    def draw(self, context):
        layout = self.layout
        layout.operator('mine.origintoselectedscript', text='Origin to selected')
        layout.operator('mine.disabledoublesidedforselected', text='Disable Double Side')
        layout.operator('mine.separateselectionwithoutdeleting', text='Separate Selection without deleting')
        layout.operator('mine.seamsfromsharpedges', text='Create seams from sharp')
        layout.operator_context = 'INVOKE_DEFAULT'
        layout.operator(DrawMesh.bl_idname, text='Draw Mesh', icon = "LINE_DATA")

class OriginToSelectedScript(bpy.types.Operator):
    bl_idname = 'mine.origintoselectedscript'
    bl_label = 'Take origin to selection'
    bl_options = {'REGISTER', 'UNDO'}
    
    def execute(self, context):
        bpy.ops.view3d.snap_cursor_to_selected()
        bpy.ops.object.editmode_toggle()
        bpy.ops.object.origin_set(type='ORIGIN_CURSOR')

        return {'FINISHED'}

class DisableDoubleSidedForSelectedScript(bpy.types.Operator):
    bl_idname = "mine.disabledoublesidedforselected"
    bl_label = 'Disables Double sidenessnessness for selected'
    bl_options = {'REGISTER', 'UNDO'}

    def execute(self, context):
        for obj in bpy.context.selected_objects:
            obj.data.show_double_sided = False

        return {'FINISHED'}

class SeparateSelectionWithoutDeleting(bpy.types.Operator):
    bl_idname = "mine.separateselectionwithoutdeleting"
    bl_label = "Separate without deleting"
    bl_options = {'REGISTER', 'UNDO'}

    def execute(self, context):
        bpy.ops.mesh.duplicate()
        bpy.ops.mesh.separate(type='SELECTED')
        return {'FINISHED'}

class SeamsFromSharpEdges(bpy.types.Operator):
    bl_idname = 'mine.seamsfromsharpedges'
    bl_label = 'Create seams from edges marked as sharp'
    bl_options = {'REGISTER', 'UNDO'}

    def execute(self, context):
        for edge in bpy.context.active_object.data.edges:
            if edge.use_edge_sharp == True:
                edge.use_seam = True
        return {'FINISHED'}

class GroupScript(bpy.types.Operator):
    bl_label = "Group from empty"
    bl_idname = "mine.groupscriptop"

    def execute(self, context):
        zaznaczone = bpy.context.selected_objects
        bpy.ops.object.empty_add(type='PLAIN_AXES', view_align=False, location=(0, 0, 0))

        for obj in zaznaczone:
            obj.select = 1

        bpy.ops.object.parent_set(type='OBJECT', keep_transform=False)
        bpy.context.scene.objects.active.name = "New Group"
        return {"FINISHED"}

class CtrlDScript(bpy.types.Operator):
    """My CtrlD Script"""
    bl_idname = "mine.ctrldscript"
    bl_label = "Ctrl D to do things"
    bl_options = {'REGISTER', 'UNDO'}
    
    def execute(self, context):
        obj=bpy.context.object
        if obj.mode == 'EDIT':
            bpy.ops.mesh.extrude_region()
        
        else:
            bpy.ops.object.duplicate()
            
        return {'FINISHED'}

class ToggleSubD(bpy.types.Operator):
    bl_idname = "mine.togglesubd"
    bl_label = "Toggle SubDMod visibility"
    
    def execute(self, context):
        for obj in bpy.context.selected_objects:
            try:
                if obj.modifiers["Subsurf"].show_viewport == False:
                    obj.modifiers["Subsurf"].show_viewport = True
                else:
                    obj.modifiers["Subsurf"].show_viewport = False
                    
            except KeyError:
                bpy.ops.object.modifier_add(type='SUBSURF')


        return {'FINISHED'}

class DrawMesh(bpy.types.Operator):
    """Copied and edited from booltool plugin"""
    bl_idname = "mine.drawmesh"
    bl_label = "Draw Mesh With Pencil"

    count=0
    
    @classmethod
    def poll(cls, context):
        return context.active_object is not None

    def modal(self,context, event):
        self.count +=1
        actObj = bpy.context.active_object
        if self.count == 1:
            actObj.select = True
            bpy.ops.gpencil.draw('INVOKE_DEFAULT',mode ="DRAW")

        if event.type in {'RET', 'NUMPAD_ENTER', 'E'}:
            
            bpy.ops.gpencil.convert(type='POLY')
            for obj in context.selected_objects:
                if obj.type == "CURVE":
                    obj.name = "PolyDraw"
                    bpy.context.scene.objects.active = obj
                    bpy.ops.object.select_all(action='DESELECT')
                    obj.select = True
                    bpy.ops.object.convert(target="MESH")
                    bpy.ops.object.mode_set(mode='EDIT')
                    bpy.ops.mesh.select_all(action='SELECT')
                    bpy.ops.mesh.edge_face_add()
                    bpy.ops.mesh.flip_normals()
                    bpy.ops.object.mode_set(mode='OBJECT')
                    bpy.ops.object.origin_set(type='ORIGIN_CENTER_OF_MASS')
                    bpy.ops.object.modifier_add(type="SOLIDIFY")
                    for mod in obj.modifiers:
                        if mod.name == "Solidify":
                            mod.name = "BTool_PolyBrush"
                            mod.thickness = 1
                            mod.offset = 0
                            mod.edge_crease_outer = 1
                            mod.edge_crease_inner = 1
                    bpy.ops.object.shade_smooth()
                    bpy.context.object.data.use_auto_smooth = True
                    bpy.context.object.data.auto_smooth_angle = 0.872665

                    obj["BoolToolPolyBrush"] = True             
            
                    bpy.ops.object.select_all(action='DESELECT')
                    bpy.context.scene.objects.active = actObj
                    bpy.context.scene.update()
                    actObj.select = True
                    obj.select = True
                    actObj.grease_pencil.clear()
                    bpy.ops.gpencil.data_unlink()
                    
            
            return {'FINISHED'}

        if event.type in {'ESC'}:
            bpy.ops.ed.undo() # remove o Grease Pencil
            return {'CANCELLED'}
        
        return {'RUNNING_MODAL'}


    def invoke(self, context, event):
        if context.object:
            context.window_manager.modal_handler_add(self)
            return {'RUNNING_MODAL'}
        else:
            self.report({'WARNING'}, "No active object, could not finish")
            return {'CANCELLED'}
        

def register():
    bpy.utils.register_class(MainCustomMenu)
    bpy.utils.register_class(OriginToSelectedScript)
    bpy.utils.register_class(DisableDoubleSidedForSelectedScript)
    bpy.utils.register_class(GroupScript)
    bpy.utils.register_class(CtrlDScript)
    bpy.utils.register_class(SeparateSelectionWithoutDeleting)
    bpy.utils.register_class(SeamsFromSharpEdges)
    bpy.utils.register_class(ToggleSubD)
    bpy.utils.register_class(DrawMesh)

def unregister():
    bpy.utils.unregister_class(MainCustomMenu)
    bpy.utils.unregister_class(OriginToSelectedScript)
    bpy.utils.unregister_class(DisableDoubleSidedForSelectedScript)
    bpy.utils.unregister_class(GroupScript)
    bpy.utils.unregister_class(CtrlDScript)
    bpy.utils.unregister_class(SeparateSelectionWithoutDeleting)
    bpy.utils.unregister_class(SeamsFromSharpEdges)
    bpy.utils.unregister_class(ToggleSubD)
    bpy.utils.unregister_class(DrawMesh)

if __name__ == '__main__':
    register()
