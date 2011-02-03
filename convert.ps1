foreach ($_ in $args[0]) {
  $f = Get-Content $_;
  $i = 0;
  $start = 0;
  $len = $f.length;
  while($i -lt $len) {
    $f[$i] = $f[$i].Replace("\ae","æ").Replace("\oe","œ").Replace("\'{a}","á").Replace("\'{e}","é").Replace("\'{\i}","í").Replace("\'{o}","ó").Replace("\'{u}","ú").Replace("\'{y}","ý").Replace("\""{e}","ë").Replace("\AE","Æ").Replace("\OE","Œ").Replace("\'{A}","Á").Replace("\'{E}","É").Replace("\'{\I}","Í").Replace("\'{O}","Ó").Replace("\'{U}","Ú").Replace("\'{Y}","Ý").Replace("\""{E}","Ë") -replace "^\{\\bf Psalm.*$|^%.*$|^\{\\bf\s\d+\}\s+|\s+\\\\$","";
    if($f[$i] -eq "") {
      if($start -eq $i) {
        $start = $i + 1;
      }
    }
    $i++;
  }
  $i = $len - 1;
  while($i -gt 0) {
    if($f[$i] -eq "") {
      $len = $i;
      $i--;
    } else {
      break;
    }
  }
  $f[$start..$len] | out-file ($_.Name) -Encoding UTF8
}