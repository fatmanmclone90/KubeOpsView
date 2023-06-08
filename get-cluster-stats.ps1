function GetStringBetweenTwoStrings($text, $firstString, $secondString, $importPath){

    $pattern = "(?s)$firstString((?s).*?)(?s)$secondString"
    # munging the formatting of multiline strings
    $result = [regex]::Match($text,$pattern).Groups[1].Value

    return $result
}

$nodes = kubectl get nodes -o NAME

# Repeat for memory
$cpus = @();

# formatting wrong
$cpus += "Request`tLimit"
$cpus += "---`t---"

foreach ($node in $nodes)
{
    $node = $node.TrimStart("node/")
    $describe = kubectl describe node $node   
    $resources = GetStringBetweenTwoStrings $describe "Allocated resources:" "Events:"
    #$resources = $resources.Trim()
    #$resources = $resources.TrimStart("(Total limits may be over 100 percent, i.e., overcommitted.)")

    $cpu = GetStringBetweenTwoStrings $resources "cpu" "memory"
    $cpus += $cpu.Trim();
}

Write-Output $cpus