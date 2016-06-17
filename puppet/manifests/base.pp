
class base {

  exec { "initial-apt-get-update":
    command => "/usr/bin/apt-get update",
  }->

  package { "git":
    ensure => "present",
  }->

  package { "zip":
    ensure => "present",
  }

  package { "python-dev":
  	ensure => "present",
  }

  package { "python-pip":
  	ensure => "present",
  }

  package { "python-numpy":
  	ensure => "present",
  }

  package { "gfortran":
  	ensure => "present",
  }

  package { "libopenblas-dev":
  	ensure => "present",
  }

  package { "liblapack-dev":
  	ensure => "present",
  }

  package { "python-matplotlib":
  	ensure => "present",
  }

  package { "sox":
  	ensure => "present",
  }

  package { "libsox-fmt-mp3":
  	ensure => "present",
  }

}

include base
