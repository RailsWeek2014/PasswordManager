$(document).ready -> $('#divIndexInhalt').html("<%= escape_javascript(render partial: 'passwordmanager/search_body', locals: {passwords:@passwords, isLogin:true, route:'index'}) %>");