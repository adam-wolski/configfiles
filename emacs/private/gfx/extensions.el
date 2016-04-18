(setq gfx-pre-extensions '())

;; Post extensions are loaded *after* the packages
(setq gfx-post-extensions
  '(
    hlsl-mode
    glsl-mode
    ))

(defun gfx/init-hlsl-mode ()
  (use-package hlsl-mode
               :mode "\\.hlsl\\'" "\\.mt\\'" "\\.mth\\'"))


(defun gfx/init-glsl-mode ()
  (use-package glsl-mode
               :mode "\\.glsl\\'" "\\.vert\\'" "\\.frag\\'"))
