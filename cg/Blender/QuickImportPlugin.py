bl_info = {'name': 'Quick Import',
        'description': 'Basic quick import plugin for obj and fbx with select multiple files functionality',
        'author': 'miniu',
        'version': (0, 0, 1),
        'blender': (2,71,0),
        'category': 'Mine',
        }

import bpy
from os.path import join as osJoin
from os.path import dirname
from bpy_extras.io_utils import ImportHelper
from bpy.props import StringProperty, BoolProperty, EnumProperty, CollectionProperty

def importScript(folder, filelist, objsplit):
    for f in filelist:
        f = f.name

        if f.endswith(('.fbx', '.FBX',)):
            bpy.ops.import_scene.fbx(filepath=osJoin(folder, f))

            try:
                bpy.context.selected_objects[0].data.use_auto_smooth = True
                bpy.context.selected_objects[0].data.auto_smooth_angle = 0.872665
                bpy.ops.object.shade_smooth()
            except AttributeError:
                pass

        if f.endswith(('.obj', '.OBJ',)):
            bpy.ops.import_scene.obj(filepath=osJoin(folder, f),
                    use_split_objects = objsplit)

            try:
                bpy.context.selected_objects[0].data.use_auto_smooth = True
                bpy.context.selected_objects[0].data.auto_smooth_angle = 0.872665
                bpy.ops.object.shade_smooth()
            except AttributeError:
                pass

    return {'FINISHED'}

class ImportUI(bpy.types.Operator, ImportHelper):
    bl_idname = 'mine.importui'
    bl_label = 'Quick import Plugin'

    filter_glob = StringProperty(
            default='*',
            )

    objUseSplitObjects = BoolProperty(
            name='obj -> Use: Split Objects',
            default=True)

    files = CollectionProperty(name='File paths', type=bpy.types.OperatorFileListElement)

    def execute(self, context):
        return importScript(dirname(self.filepath), self.files, self.objUseSplitObjects)

def register():
    bpy.utils.register_class(ImportUI)

def unregister():
    bpy.utils.unregister_class(ImportUI)

if __name__ == "__main__":
    register()

    bpy.ops.mine.importui('INVOKE_DEFAULT')
