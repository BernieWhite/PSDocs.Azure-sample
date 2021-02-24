
Export-PSDocumentConvention 'AddMeta' {
    $template = Get-Item -Path $PSDocs.TargetObject;

    # Get parent directory paths where <templateName>/v<version>/template.json
    $version = $template.Directory.Name;
    $templateName = $template.Directory.Parent.Name;
    $PSDocs.Document.Data['template.version'] = $version;
    $PSDocs.Document.Data['template.name'] = $templateName;

    # Name the document <templateName>_<version>.md
    $docName = $version;
    if ($version -like 'v*') {
        $docName = [String]::Concat($templateName, '_', $version);
    }
    $PSDocs.Document.InstanceName = $docName;


    $metadata = GetTemplateMetadata -Path $PSDocs.TargetObject;
    # $Document.Metadata['title'] = $metadata.name;
    $Document.Metadata['parent'] = $metadata.name;
    $Document.Metadata['layout'] = 'template';

    $PSDocs.Document.OutputPath = Join-Path -Path $PSDocs.Document.OutputPath -ChildPath $templateName
} -End {
    

    foreach ($output in ($PSDocs.Output | Group-Object -Property OutputPath)) {
        $header = Get-PSDocumentHeader -Path $output.Name;
        $indexPath = Join-Path -Path $output.Name -ChildPath 'index.md';
        @(
            '---'
            "title: $($header.parent)"
            'has_children: true'
            '---'
        ) | Set-Content -Path $indexPath;
    }
}
