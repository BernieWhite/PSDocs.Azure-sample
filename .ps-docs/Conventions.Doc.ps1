
Export-PSDocumentConvention 'AddMkDocsMeta' {
    $template = Get-Item -Path $PSDocs.TargetObject;

    # Get parent directory paths where <templateName>/v<version>/template.json
    $version = $template.Directory.Name;
    $templateName = $template.Directory.Parent.Name;

    $metadata = GetTemplateMetadata -Path $PSDocs.TargetObject;
    $Document.Metadata['title'] = $version;
    $Document.Metadata['description'] = $metadata.description;

    if ($Null -ne $metadata.name) {
        $templateName = $metadata.name.Replace(' ', '-');
    }

    $PSDocs.Document.InstanceName = $version;
    $PSDocs.Document.OutputPath = Join-Path -Path $PSDocs.Document.OutputPath -ChildPath $templateName
}
