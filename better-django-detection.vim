function FindDjangoSettings2()
    if strlen($VIRTUAL_ENV) && has('python')
        let django_check = system("pip freeze | grep -q Django")
        if v:shell_error
            " echo 'django not installed.'
        else
            " echo 'django is installed.'
            let output  = system("find $VIRTUAL_ENV \\( -wholename '*/lib/*' -or -wholename '*/install/' \\) -or \\( -name 'settings.py' -print0 \\) | tr '\n' ' '")
            let outarray= split(output, '[\/]\+')
            let module  = outarray[-2] . '.' . 'settings'
            let syspath = system("python -c 'import sys; print sys.path' | tr '\n' ' ' ")
            " let curpath = '/' . join(outarray[:-2], '/')
            execute 'python import sys, os'
            " execute 'python sys.path.append("' . curpath . '")'
            " execute 'python sys.path.append("' . syspath . '")'
            execute 'python sys.path = ' . syspath
            execute 'python os.environ.setdefault("DJANGO_SETTINGS_MODULE", "' . module . '")'
        endif
    endif
endfunction