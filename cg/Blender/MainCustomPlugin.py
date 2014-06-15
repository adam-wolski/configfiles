bl_info = {'name': 'My main tools',
        'description': 'Custom often used tools',
        'author': 'miniu',
        'version': (0, 3),
        'blender': (2,70,0),
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

def register():
    bpy.utils.register_class(MainCustomMenu)
    bpy.utils.register_class(OriginToSelectedScript)
    bpy.utils.register_class(DisableDoubleSidedForSelectedScript)
    bpy.utils.register_class(GroupScript)
    bpy.utils.register_class(CtrlDScript)
    bpy.utils.register_class(SeparateSelectionWithoutDeleting)
    
def unregister():
    bpy.utils.unregister_class(MainCustomMenu)
    bpy.utils.unregister_class(OriginToSelectedScript)
    bpy.utils.unregister_class(DisableDoubleSidedForSelectedScript)
    bpy.utils.unregister_class(GroupScript)
    bpy.utils.unregister_class(CtrlDScript)
    bpy.utils.unregister_class(SeparateSelectionWithoutDeleting)

if __name__ == '__main__':
    register()
