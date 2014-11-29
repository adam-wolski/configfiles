import bpy
l0 = bpy.context.user_preferences.system.solid_lights[0]
l1 = bpy.context.user_preferences.system.solid_lights[1]
l2 = bpy.context.user_preferences.system.solid_lights[2]

l0.use = True
l0.diffuse_color = (0.26847368478775024, 0.42352432012557983, 0.5927237272262573)
l0.specular_color = (0.4590410590171814, 0.4590410590171814, 0.4590410590171814)
l0.direction = (-0.4225352108478546, 0.2816901206970215, 0.8614607453346252)
l1.use = True
l1.diffuse_color = (0.5999999046325684, 0.4565461277961731, 0.28016602993011475)
l1.specular_color = (0.11451194435358047, 0.11451194435358047, 0.11451194435358047)
l1.direction = (0.3239436447620392, 0.6760563254356384, 0.6618219614028931)
l2.use = True
l2.diffuse_color = (0.2477761209011078, 0.259685754776001, 0.3079513609409332)
l2.specular_color = (0.10956870764493942, 0.0, 0.0)
l2.direction = (0.5099194645881653, -0.7052077651023865, -0.49260953068733215)