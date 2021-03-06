function Remove-OneLoginUserRole
{
    [CmdletBinding(SupportsShouldProcess,ConfirmImpact = "High")]
    param
    (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [OneLogin.User]
        $Identity,

        [Parameter(Mandatory = $true)]
        [int[]]
        $RoleId
    )
    
    begin
    {
        $Splat = @{
            Method = "Put"
            Body   = @{role_id_array = $RoleId}
        }
    }
    
    process
    {
        $Splat["Endpoint"] = "api/1/users/$($Identity.id)/remove_roles"
        if ($PSCmdlet.ShouldProcess($Identity, $MyInvocation.MyCommand.Name))
        {
            Invoke-OneLoginRestMethod @Splat
        }
    }
}