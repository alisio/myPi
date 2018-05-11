class samba (
    $share  =   'pi',
    $shareUsuario = 'pi',
    $shareSenha = 'pi',
    $shareIP = 'pi',
    $sharePontoDeMontagem = '/mnt/pi'
    $shareUID = 1000
  ) {
    exec { $sharePontoDeMontagem:
      command => "mkdir -p $sharePontoDeMontagem",
      unless  => "test -d $sharePontoDeMontagem",
      path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
      # refreshonly => true,
    }
   file_line { 'adicionar mapeamento do share de rede' :
     path => '/etc/fstab',
     line => "//${shareIP}/${share} ${sharePontoDeMontagem} cifs vers=1.0,user=$shareUsuario,pass=${shareSenha},rw,uid=${shareUID},iocharset=utf8,sec=ntlm 0 0",
     require => Exec[$sharePontoDeMontagem],
   }
}
