################################## ATTCKnowledge
<#
# SRC
$Ent='https://raw.githubusercontent.com/mitre/cti/master/enterprise-attack/enterprise-attack.json'
#StillToDoWhenIHaveSomeTime
$Pre='https://raw.githubusercontent.com/mitre/cti/master/pre-attack/pre-attack.json'
$Mob='https://raw.githubusercontent.com/mitre/cti/master/mobile-attack/mobile-attack.json'
#>

################################################
######################################## Objects
$Banner = @('
=======================
===  ATTCKnowledge  ===
===       , ,       ===
=== _#_  {0,0}  _#_ ===
=== |A|  /)_)   |A| ===
=== |T|   /"\   |T| ===
=== |T|  / @ \  |T| ===
=== |&| /=====\ |&| ===
=== |C|/=======\|C| ===
=== |K|=========|K| ===
=======================
== SadProcessor 2019 ==
=======================
')

#region Objects

## Knowledge Obj
if(-Not$ATTCK.Technique){$ATTCK = New-Object PSCustomObject -Property @{
    # POST
    Tactic          = @()
    Technique       = @()
    Group           = @()
    Software        = @()
    Relationship    = @() <# No Class #>
    # PRE
    TacticPRE       = @()
    TechniquePRE    = @()
    GroupPRE        = @() <# Alias/ID #>
    RelationshipPRE = @() <# No Class #>
    # MOB
    TacticMOB       = @()
    TechniqueMOB    = @()
    GroupMOB        = @() <# Alias/ID #>
    SoftwareMOB     = @()
    RelationshipMOB = @() <# No Class #>
    }}


## POST
# Tactic Class
class ATTCKTactic{
    [string]$Name
    [string]$Description
    [string[]]$Type
    [string]$ID
    [string]$Wiki
    [PScustomObject]$Reference
    [datetime]$Created
    [datetime]$Modified
    [string[]]$Contributor
    [string]$STIX
    }
Update-TypeData -TypeName ATTCKTactic -DefaultDisplayPropertySet ID,Name,Description -Force

## Technique Class
class ATTCKTechnique{
    [string]$Name
    [string[]]$Tactic
    [string]$Description
    [string[]]$Platform
    [string[]]$Permission
    [string[]]$Bypass    
    [string[]]$EffectivePerm
    [string]$Network             
    [string]$Remote      
    [string]$Prereq
    [String]$Detection
    [string]$Mitigation
    [string[]]$DataSource
    [string]$ID
    [string]$Wiki
    [PSCustomObject]$Reference
    [DateTime]$Created
    [DateTime]$Modified
    [string[]]$Contributor
    [string]$STIX
    }
Update-TypeData -TypeName ATTCKTechnique -DefaultDisplayPropertySet ID,Name,Tactic,Description,Mitigation -Force

# Software Class
class ATTCKSoftware{    
    [String]$Name
    [String]$Description
    [String]$Type 
    [String[]]$Alias
    [String]$ID
    [String]$Wiki
    [PSCustomObject]$Reference
    [DateTime]$Created
    [DateTime]$Modified
    [string[]]$Contributor
    [String]$STIX
    }
Update-TypeData -TypeName ATTCKSoftware -DefaultDisplayPropertySet ID,Name,Type,Description -Force

# Group Class
class ATTCKGroup{
    [string]$Name
    [string]$Description
    [string[]]$Alias
    [string]$ID
    [string]$Wiki
    [PScustomObject]$Reference
    [datetime]$Created
    [datetime]$Modified
    [string[]]$Contributor
    [string]$STIX
    }
Update-TypeData -TypeName ATTCKGroup -DefaultDisplayPropertySet ID,Name,Alias,Description -Force



## PRE
# TacticPRE Class
class ATTCKTacticPRE{
    [string]$Name
    [string]$Description
    [string]$Type
    [string]$ID
    [string]$Wiki
    [PScustomObject]$Reference
    [datetime]$Created
    [datetime]$Modified
    [string]$Contributor
    [string]$STIX
    }
Update-TypeData -TypeName ATTCKTacticPRE -DefaultDisplayPropertySet ID,Name,Description -Force

## TechniquePRE Class
class ATTCKTechniquePRE{
    [string]$Name
    [string[]]$Tactic
    [string]$Description
    [string]$Difficult
    [string]$Difficulty
    [string]$Detectable
    [string]$Detection
    [string]$OldID
    [string]$ID
    [string]$Wiki
    [PSCustomObject]$Reference
    [DateTime]$Created
    [DateTime]$Modified
    [string]$Contributor
    [string]$STIX
    }
Update-TypeData -TypeName ATTCKTechniquePRE -DefaultDisplayPropertySet ID,Name,Tactic,Description,Detection -Force

# GroupPRE Class
class ATTCKGroupPRE{
    [string]$Name
    [string]$ID
    }



## MOB
# MOB - Tactic Class
class ATTCKTacticMOB{
    [string]$Name
    [string]$Description
    [string[]]$Type
    [string]$ID
    [string]$Wiki
    [PScustomObject]$Reference
    [datetime]$Created
    [datetime]$Modified
    [string[]]$Contributor
    [string]$STIX
    }
Update-TypeData -TypeName ATTCKTacticMOB -DefaultDisplayPropertySet ID,Name,Description -Force


# MOB - Technique Class
class ATTCKTechniqueMOB{
    [string]$Name
    [string[]]$Tactic
    [string]$Description
    [string[]]$Platform
    #[string[]]$Permission
    #[string[]]$Bypass    
    #[string[]]$EffectivePerm
    #[string]$Network             
    #[string]$Remote      
    #[string]$Prereq
    #[String]$Detection
    #[string]$Mitigation
    #[string[]]$DataSource
    [string]$ID
    [string]$Wiki
    [PSCustomObject]$Reference
    [DateTime]$Created
    [DateTime]$Modified
    [string[]]$Contributor
    [string]$STIX
    }
Update-TypeData -TypeName ATTCKTechniqueMOB -DefaultDisplayPropertySet ID,Name,Tactic,Description -Force

# MOB - Software Class
class ATTCKSoftwareMOB{    
    [String]$Name
    [String]$Description
    [String]$Type 
    [String[]]$Alias
    [String]$ID
    [String]$Wiki
    [PSCustomObject]$Reference
    [DateTime]$Created
    [DateTime]$Modified
    [string[]]$Contributor
    [String]$STIX
    }
Update-TypeData -TypeName ATTCKSoftwareMOB -DefaultDisplayPropertySet ID,Name,Type,Description -Force

# MOB - Group Class
class ATTCKGroupMOB{
    [string]$Name
    [string]$Description
    [string[]]$Alias
    [string]$ID
    [string]$Wiki
    [PScustomObject]$Reference
    [datetime]$Created
    [datetime]$Modified
    [string[]]$Contributor
    [string]$STIX
    }
Update-TypeData -TypeName ATTCKGroupMOB -DefaultDisplayPropertySet ID,Name,Alias,Description -Force



#endregion

#region Common

################################################
################################## [Helper] DynP

<# Helper Dynamic Params #>
function DynP{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=1)][String]$Name,
        [Parameter(Mandatory=1)][string]$Type,
        [Parameter(Mandatory=0)][bool]$Mandat=0,
        [Parameter(Mandatory=0)][int]$Pos=$Null,
        [Parameter(Mandatory=0)][bool]$Pipe=0,
        [Parameter(Mandatory=0)][bool]$PipeProp=0,
        [Parameter(Mandatory=0)]$VSet=$Null
        )
    # Create Attribute Obj
    $Attrb = New-Object Management.Automation.ParameterAttribute
    $Attrb.Mandatory=$Mandat
    $Attrb.ValueFromPipeline=$Pipe
    $Attrb.ValueFromPipelineByPropertyName=$PipeProp
    if($Pos -ne $null){$Attrb.Position=$Pos}
    # Create AttributeCollection
    $Cllct = New-Object Collections.ObjectModel.Collection[System.Attribute]
    # Add Attribute Obj to Collection
    $Cllct.Add($Attrb)
    if($VSet -ne $Null){
        # Create ValidateSet & add to collection     
        $VldSt=New-Object Management.Automation.ValidateSetAttribute($VSet)
        $Cllct.Add($VldSt)
        }
    # Create Runtine DynParam
    $DynP = New-Object Management.Automation.RuntimeDefinedParameter("$Name",$($Type-as[type]),$Cllct)
    # Return DynParam
    Return $DynP
    }
#End



################################################
###################################### Knowledge

<#
.Synopsis
   ATT&CK Knowledge
.DESCRIPTION
   ## Action
   - Display ATT&CK cmdlets
   - Open ATT&Ck wiki in browser
   - Sync Knowledge object from Mitre/cti Github repo

   ## Syntax 
   ATTCKnowledge [-Online]
   ATTCKnowledge [-Sync] [-Verbose]

   See examples for details 
   PS> Help ATTCKKnowledge -Example

   ## Info
   Using -Sync fetches a single json data object
   from the Mitre cti github repo.
   Data is formated and stored in memory for session.
.EXAMPLE
    ATTCKnowledge
    Display available cmdlets
.EXAMPLE
    ATTCKnowledge -Online
    Open ATT&CK in browser
.EXAMPLE
    ATTCKnowledge -Sync [-Verbose]
    Fetch ATT&CK Knowledge object from github
#>
function Invoke-ATTCKnowledge{
    [Alias('ATTCKnowledge')]
    [CmdletBinding(DefaultParametersetName='View',HelpURI='https://attack.mitre.org/wiki/Main_Page')]
    Param(
        [Parameter(Mandatory=0,ParameterSetName='View')][Switch]$Online,
        [Parameter(Mandatory=1,ParameterSetName='Sync')][Switch]$Sync
        )
    ## If Sync
    if($PSCmdlet.ParameterSetName -eq 'Sync'){
        # Banner
        Write-Host "$Banner" -ForegroundColor Cyan
        ################################################ POST
        # Get ATTCKnowledge Json obj from Github
        Write-Verbose "[+] Importing ATT&CK Knowledge..."
        $url = 'https://raw.githubusercontent.com/mitre/cti/master/enterprise-attack/enterprise-attack.json'
        if($PSVersionTable.PSEdition -eq 'Desktop'){
            [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12
            $Json = irm $url -Verbose:$false
            }
        if($PSVersionTable.PSEdition -eq 'Core'){
            $Json = curl -s $url | ConvertFrom-Json 
            }
        # Stop if not found
        if(-Not$Json.Objects.count){
            Write-Warning '[!] No Object Found'
            Return
            }
        # Tactic Obj Collection
        Write-Verbose "[+] Formating Tactic Objects..."
        $ATTCK.Tactic = $Json.Objects | where type -eq x-mitre-tactic |%{
            [ATTCKTactic]@{    
                Name        = $_.name
                Description = $_.description
                Type        = $_.type 
                ID          =($_.external_references |? source_name -eq mitre-attack).external_id
                Wiki        =($_.external_references |? source_name -eq mitre-attack).url
                Reference   = $_.external_references |? source_name -ne mitre-attack
                Created     = $_.created
                Modified    = $_.modified
                STIX        = $_.id
                }} 
        # Technique Obj Collection
        Write-Verbose "[+] Formating Technique Objects..."
        $TacList = $Json.Objects | Where type -eq course-of-action
        $ATTCK.Technique = $Json.Objects | Where type -eq attack-pattern |%{
            $TechName = $_.name
            [ATTCKTechnique]@{
                Name        = $TechName
                Tactic      = $_.kill_chain_phases.phase_name
                Description = $_.description
                Platform    = $_.x_mitre_platforms
                Permission  = $_.x_mitre_permissions_required               
                Bypass      = $_.x_mitre_defense_bypassed     
                EffectivePerm=$_.x_mitre_effective_permissions
                Network     = $_.x_mitre_network_requirements              
                Remote      = $_.x_mitre_remote_support       
                Prereq      = $_.x_mitre_system_requirements
                Detection   = $(try{($_.description | sls -pattern '((Detection:)(?ms)(.*)(Platform))').matches.Groups[3].value.trim()}Catch{})
                Mitigation  = ($TacList | Where name -match $TechName).description
                DataSource  = $_.x_mitre_data_sources 
                ID          =($_.external_references |? source_name -eq mitre-attack).external_id
                Wiki        =($_.external_references |? source_name -eq mitre-attack).url
                Reference   = $_.external_references |? source_name -ne mitre-attack
                Created     = $_.created
                Modified    = $_.modified
                Contributor = $_.x_mitre_contributors
                STIX        = $_.id
                }}
        # Group Obj Collection
        Write-Verbose "[+] Formating Group Objects..."
        $ATTCK.Group = $Json.Objects | Where type -eq intrusion-set |%{
            [ATTCKGroup]@{
                Name        = $_.name
                Description = $_.description
                Alias       = $_.aliases
                ID          =($_.external_references |? source_name -eq mitre-attack).external_id
                Wiki        =($_.external_references |? source_name -eq mitre-attack).url
                Reference   = $_.external_references |? source_name -ne mitre-attack
                Created     = $_.created
                Modified    = $_.modified
                Contributor = $_.x_mitre_contributors
                STIX        = $_.id
                }}  
        # Software Obj Collection
        Write-Verbose "[+] Formating Software Objects..."
        $ATTCK.Software = $Json.Objects | Where {$_.type -eq 'tool' -OR $_.type -eq 'malware'} |%{
            [ATTCKSoftware]@{    
                Name        = $_.name
                Description = $_.description
                Type        = $_.type 
                Alias       = $_.x_mitre_aliases
                ID          =($_.external_references |? source_name -eq mitre-attack).external_id
                Wiki        =($_.external_references |? source_name -eq mitre-attack).url
                Reference   = $_.external_references |? source_name -ne mitre-attack
                Created     = $_.created
                Modified    = $_.modified
                Contributor = $_.x_mitre_contributors
                STIX        = $_.id
                }}
        # Relationship Obj Collection
        Write-Verbose "[+] Formating Relationship Objects..."
        $ATTCK.Relationship = $Json.Objects | Where type -eq 'relationship' |%{
            [PSCustomObject]@{    
                Source=$_.source_ref
                Edge  =$_.relationship_type
                Target=$_.target_ref
                Description=$_.Description
                Reference = $_.external_references
                }} 
        
        ################################################ PRE
        # Get ATTCKnowledge Json obj from Github - PRE
        Write-Verbose "[+] Importing PRE_ATT&CK Knowledge..."
        $url = 'https://raw.githubusercontent.com/mitre/cti/master/pre-attack/pre-attack.json'
        if($PSVersionTable.PSEdition -eq 'Desktop'){
            [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12
            $Json = irm $url -Verbose:$false
            }
        if($PSVersionTable.PSEdition -eq 'Core'){
            $Json = curl -s $url | ConvertFrom-Json 
            }
        # Stop if not found
        if(-Not$Json.Objects.count){
            Write-Warning '[!] No Object Found'
            Return
            }
        # TacticPRE Obj Collection
        Write-Verbose "[+] Formating TacticPRE Objects..."
        $ATTCK.TacticPRE = $Json.Objects | where type -eq x-mitre-tactic |%{
            [ATTCKTacticPRE]@{    
                Name        = $_.name
                Description = $_.description
                Type        = $_.type 
                ID          =($_.external_references |? source_name -eq mitre-attack).external_id
                Wiki        =($_.external_references |? source_name -eq mitre-attack).url
                Reference   = $_.external_references |? source_name -eq mitre-attack
                Created     = $_.created
                Modified    = $_.modified
                Contributor = $_.created_by_ref
                STIX        = $_.id
                }} 
        # TechniquePRE Obj Collection
        Write-Verbose "[+] Formating TechniquePRE Objects PRE..."
        $TacList = $Json.Objects | Where type -eq course-of-action
        $ATTCK.TechniquePRE = $Json.Objects | Where type -eq attack-pattern |%{
            $TechName = $_.name
            [ATTCKTechniquePRE]@{
                Name        = $TechName
                Tactic      = $_.kill_chain_phases.phase_name
                Description = $_.description
                Difficult   = $_.x_mitre_difficulty_for_adversary
                Difficulty  = $_.x_mitre_difficulty_for_adversary_explanation
                Detectable  = $_.x_mitre_detectable_by_common_defenses
                Detection   = $_.x_mitre_detectable_by_common_defenses_explanation
                OldID       = $_.x_mitre_old_attack_id 
                ID          =($_.external_references |? source_name -eq mitre-pre-attack).external_id
                Wiki        =($_.external_references |? source_name -eq mitre-pre-attack).url
                Reference   = $_.external_references |? source_name -ne mitre-pre-attack
                Created     = $_.created
                Modified    = $_.modified
                Contributor = $_.created_by_ref
                STIX        = $_.id
                }}
        # Prep Group Obj Collection
        Write-Verbose "[+] Formating Group Objects..."
        $ATTCK.GroupPRE = $Json.Objects | Where type -eq intrusion-set |%{
            [ATTCKGroupPRE]@{
                Name        = $_.name
                #Description = $_.description
                #Alias       = $_.aliases
                ID          =($_.external_references |? source_name -eq mitre-attack).external_id
                #Wiki        =($_.external_references |? source_name -eq mitre-pre-attack).url
                #Reference   = $_.external_references |? source_name -ne mitre-pre-attack
                #Created     = $_.created
                #Modified    = $_.modified
                #Contributor = $_.x_mitre_contributors
                #STIX        = $_.id
                }}  
        # Prep Software Obj Collection
        #Write-Verbose "[+] Formating Software Objects..."
        #<None>

        # Prep Relationship Obj Collection
        Write-Verbose "[+] Formating Relationship Objects PRE..."
        $ATTCK.RelationshipPRE = $Json.Objects | Where type -eq 'relationship' |%{
            [PSCustomObject]@{    
                Source=$_.source_ref
                Edge  =$_.relationship_type
                Target=$_.target_ref
                Description=$_.Description
                Reference = $_.external_references
                }} 
        
        ################################################ MOB

        # Get ATTCKnowledge Json obj from Github
        Write-Verbose "[+] Importing ATT&CK Knowledge - Mobile..."
        $url = 'https://raw.githubusercontent.com/mitre/cti/master/mobile-attack/mobile-attack.json'
        if($PSVersionTable.PSEdition -eq 'Desktop'){
            [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12
            $Json = irm $url -Verbose:$false
            }
        if($PSVersionTable.PSEdition -eq 'Core'){
            $Json = curl -s $url | ConvertFrom-Json 
            }
        # Stop if not found
        if(-Not$Json.Objects.count){
            Write-Warning '[!] No Object Found'
            Return
            }
        # Prep Tactic Obj Collection
        Write-Verbose "[+] Formating Tactic Objects - Mobile..."
        $ATTCK.TacticMOB = $Json.Objects | where type -eq x-mitre-tactic |%{
            [ATTCKTacticMOB]@{    
                Name        = $_.name
                Description = $_.description
                Type        = $_.type 
                ID          =($_.external_references |? source_name -eq mitre-attack).external_id
                Wiki        =($_.external_references |? source_name -eq mitre-attack).url
                Reference   = $_.external_references |? source_name -ne mitre-attack
                Created     = $_.created
                Modified    = $_.modified
                STIX        = $_.id
                }} 
        # Prep Technique Obj Collection
        Write-Verbose "[+] Formating Technique Objects..."
        #Write-Verbose "[+] Matching Mitigation to Technique..."
        $TacList = $Json.Objects | Where type -eq course-of-action
        $ATTCK.TechniqueMOB = $Json.Objects | Where type -eq attack-pattern |%{
            $TechName = $_.name
            [ATTCKTechniqueMOB]@{
                Name        = $TechName
                Tactic      = $_.kill_chain_phases.phase_name
                Description = $_.description
                Platform    = $_.x_mitre_platforms
                #Permission  = $_.x_mitre_permissions_required               
                #Bypass      = $_.x_mitre_defense_bypassed     
                #EffectivePerm=$_.x_mitre_effective_permissions
                #Network     = $_.x_mitre_network_requirements              
                #Remote      = $_.x_mitre_remote_support       
                #Prereq      = $_.x_mitre_system_requirements
                #Detection   = $(try{($_.description | sls -pattern '((Detection:)(?ms)(.*)(Platform))').matches.Groups[3].value.trim()}Catch{})
                #Mitigation  = ($TacList | Where name -match $TechName).description
                #DataSource  = $_.x_mitre_data_sources 
                ID          =($_.external_references |? source_name -eq mitre-mobile-attack).external_id
                Wiki        =($_.external_references |? source_name -eq mitre-mobile-attack).url
                Reference   = $_.external_references |? source_name -ne mitre-mobile-attack
                Created     = $_.created
                Modified    = $_.modified
                Contributor = $_.x_mitre_contributors
                STIX        = $_.id
                }}
        # Prep Group Obj Collection
        Write-Verbose "[+] Formating Group Objects..."
        $ATTCK.GroupMOB = $Json.Objects | Where type -eq intrusion-set |%{
            [ATTCKGroupMOB]@{
                Name        = $_.name
                Description = $_.description
                Alias       = $_.aliases
                ID          =($_.external_references |? source_name -eq mitre-mobile-attack).external_id
                Wiki        =($_.external_references |? source_name -eq mitre-mobile-attack).url
                Reference   = $_.external_references |? source_name -ne mitre-mobile-attack
                Created     = $_.created
                Modified    = $_.modified
                Contributor = $_.x_mitre_contributors
                STIX        = $_.id
                }}  
        # Prep Software Obj Collection
        Write-Verbose "[+] Formating Software Objects..."
        $ATTCK.SoftwareMOB = $Json.Objects | Where type -match "tool|malware" |%{
            [ATTCKSoftwareMOB]@{    
                Name        = $_.name
                Description = $_.description
                Type        = $_.type 
                Alias       = $_.x_mitre_aliases
                ID          =($_.external_references |? source_name -eq mitre-mobile-attack).external_id
                Wiki        =($_.external_references |? source_name -eq mitre-mobile-attack).url
                Reference   = $_.external_references |? source_name -ne mitre-mobile-attack
                Created     = $_.created
                Modified    = $_.modified
                Contributor = $_.x_mitre_contributors
                STIX        = $_.id
                }}
        # Prep Relationship Obj Collection
        Write-Verbose "[+] Formating Relationship Objects..."
        $ATTCK.RelationshipMOB = $Json.Objects | Where type -eq 'relationship' |%{
            [PSCustomObject]@{    
                Source=$_.source_ref
                Edge  =$_.relationship_type
                Target=$_.target_ref
                Description=$_.Description
                Reference = $_.external_references
                }} 
        # Return Nothing
        Write-Verbose "[+] Done."

        ################################################ END
        # Return Nothing
        Write-Verbose "[+] Done."
        }
    ## If View
    Else{
        # If Online
        if($Online){start-Process "https://attack.mitre.org/wiki/Technique_Matrix"}
        # Else Cmdlet Memo
        else{
            $Banner
            [PSCustomObject]@{Cmdlet='Invoke-ATTCKnowledge';Alias=''               ;Help='Help ATTCKnowledge'  }
            [PSCustomObject]@{Cmdlet='Get-ATTCKTechnique'  ;Alias='ATTCK'          ;Help='Help ATTCK-Technique'}
            [PSCustomObject]@{Cmdlet='Get-ATTCKTactic'     ;Alias='ATTCK-Tactic'   ;Help='Help ATTCK-Tactic'   }
            [PSCustomObject]@{Cmdlet='Get-ATTCKGroup'      ;Alias='ATTCK-Group'    ;Help='Help ATTCK-Group'    }
            [PSCustomObject]@{Cmdlet='Get-ATTCKSoftware'   ;Alias='ATTCK-Software' ;Help='Help ATTCK-Software' }
            [PSCustomObject]@{Cmdlet='Get-ATTCKUsage'      ;Alias='ATTCK-Usage'    ;Help='Help ATTCK-Usage'    }
            }}}
#########End

#endregion 

#region POST

################################################
###################################### Technique

<#
.Synopsis
   ATT&CK Techniques
.DESCRIPTION
   ## Action
   - List all Techniques
   - View Technique(s) by name
   - View Technique(s) by ID
   - Open ATT&Ck wiki in browser
   - Filter Technique by Tactic/Platform/Context
   - Search Keyword in description

   ## Syntax 
   ATTCKTechnique [-Online]
   ATTCKTechnique [-name] [-Value] <tab> [-Online] [-Reference]
   ATTCKTechnique -ID [-Value] <tab> [-Online] [-Reference]
   ATTCKTechnique -Filter [[-Tactic] <tab>] [[-Platform] <tab>] [[-Permission] <tab>]
   ATTCKTechnique -Description [-Match] <input>
   
   See examples for details 
   PS> Help ATTCKTechnique -Example
.EXAMPLE
    ATTCKTechnique
    List all available techniques
    Use |Where or |select to filter objects
    Object Properties tab-complete after pipeline :)
.EXAMPLE
    ATTCKTechnique AppleScript
    View Technique by name
    Accepts multiple coma separated values
    Technique names tab-complete
    Add -online -> open wiki in browser
    Add -reference -> view reference
    Add -reference -online -> open reference in Browser
.EXAMPLE
    ATTCKTechnique -ID T1001
    View Technique by Mitre ID
    Accepts multiple coma separated values
    Technique IDs tab-complete
    Add -online -> open wiki in browser
    Add -reference -> view reference
    Add -reference -online -> open reference in Browser
.EXAMPLE
    ATTCKTechnique -Description 'Subtee'
    View Techniques where desciption match 'Subtee' 
.EXAMPLE
    ATTCKTechnique -Filter lateral-movement macOS root
    List macOS lateral mvt techniques that require root
    Can filter on Tactic/Platform/Permission
    (positional in this order or named params)
    All tab-completes
#>
function Get-ATTCKTechnique{
    [CmdletBinding(DefaultParameterSetName='Name',HelpURI='https://attack.mitre.org/wiki/All_Techniques')]
    [OutputType([ATTCKTechnique])]
    [Alias('ATTCK-Technique','ATTCK')]
    Param(
        # Select by Name
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Name,
        # Select by ID
        [Parameter(Mandatory=1,ParameterSetName='ID')][Switch]$ID,
        # Apply Filters
        [Parameter(Mandatory=1,ParameterSetName='Filter')][Alias('x')][Switch]$Filter,
        # Match Description
        [Parameter(Mandatory=1,ParameterSetName='Description')][Switch]$Description,
        # View Reference
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Reference,
        # View Online
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Online
        )
    DynamicParam{
        ## DynDico
        $Dico = New-Object Management.Automation.RuntimeDefinedParameterDictionary
        # If Fitler
        if($PSCmdlet.ParameterSetName -eq 'Filter'){
            # Prep DynP
            $DynTact = DynP -Name 'Tactic'     -Type 'String[]' -Pos 0 -VSet @($Attck.Technique.Tactic|sort -unique)
            $DynPlat = DynP -Name 'Platform'   -Type 'String[]' -Pos 1 -VSet @($Attck.Technique.Platform|sort -unique)
            $DynPerm = DynP -Name 'Permission' -Type 'String[]' -Pos 2 -VSet @($Attck.Technique.Permission|sort -unique)
            # DynP to Dico
            $Dico.Add('Tactic',$DynTact)
            $Dico.Add('Platform',$DynPlat)
            $Dico.Add('Permission',$DynPerm)
            }
        # If Description
        Elseif($PSCmdlet.ParameterSetName -eq 'Description'){
            $DynDesc = DynP -Name 'Match' -Type 'string' -mandat 1 -Pos 0
            $Dico.Add('Match',$DynDesc)
            }
        # Else
        else{# If ID
            if($PSCmdlet.ParameterSetName -eq 'ID'){
                $DynID = DynP -Name 'Value' -Type 'String[]' -Mandat 1 -Pos 0 -VSet @($Attck.Technique.ID)
                $Dico.Add('Value',$DynID)
                }
            # If Name
            if($PSCmdlet.ParameterSetName -eq 'Name'){
                $DynName = DynP -Name 'Value' -Type 'String[]' -Mandat 0 -Pos 0 -VSet @($Attck.Technique.Name)
                $Dico.Add('Value',$DynName)            
                }}
        ## Return Dico
        Return $Dico
        }
    Process{
        ## Get Techniques
        $Result = $Attck.Technique 
        # Apply Filters
        if($PSCmdlet.ParameterSetName -eq 'Filter'){
            if($PSBoundParameters.Tactic){$Result = $Result | ? tactic -match "$($PSBoundParameters.Tactic-join'|')"}
            if($PSBoundParameters.Platform){$Result = $Result | ? Platform -match "$($PSBoundParameters.Platform-join'|')"}
            if($PSBoundParameters.Permission){$Result = $Result | ? Permission -match "$($PSBoundParameters.Permission-join'|')"}
            }
        # Match in Description
        if($PScmdlet.ParameterSetName -eq 'Description'){$DynDesc.value
            $Result = $Result | ? Description -match $DynDesc.value
            }
        # Or - Select by ID
        if($PSCmdlet.ParameterSetName -eq 'ID'){
            if($DynID.IsSet){
                $Result = @()
                $DynID.value|%{$Result += $Attck.Technique | ? ID -eq $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.Reference;$Url = $Result.Url}
                }}
        # Or - Select by Name
        if($PSCmdlet.ParameterSetName -eq 'Name'){
            if($DynName.IsSet){
                $Result = @()
                $DynName.value|%{$Result += $Attck.Technique | ? Name -eq $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.Reference;$Url = $Result.Url}
                }}
        ## Output
        # If Online > Open URL
        if($Online){
            if(-Not$DynName.IsSet){$url='https://attack.mitre.org/wiki/All_Techniques'}
            $Url|%{try{Start-Process $_}catch{}}
            }
        # Else Return Result
        else{Return $result}
        }}
#####End



################################################
########################################## Group

<#
.Synopsis
   ATT&CK Groups
.DESCRIPTION
   ## Action
   - List all Groups
   - View Group(s) by name
   - View Group(s) by ID
   - Open ATT&Ck wiki in browser
   - Match keyword in Group description

   ## Syntax 
   ATTCK-Group [-Online]
   ATTCK-Group [-name] [-Value] <tab> [-Online] [-Reference]
   ATTCK-Group -ID [-Value] <tab> [-Online] [-Reference]
   ATTCK-Group -Description [-Match] <input>

   See examples for details 
   PS> Help ATTCK-Group -Example
.EXAMPLE
    ATTCKGroup
    List all available Groups
    Use |Where or |select to filter objects
    Object Properties tab-complete after pipeline :)
.EXAMPLE
    ATTCK-Group admin@338
    View Group by name/alias
    Accepts multiple coma separated values
    Group names tab-complete
    Add -Online -> open wiki in browser
    Add -Reference -> view reference
    Add -Reference -Online -> open reference in Browser
.EXAMPLE
    ATTCK-Group -ID G0023 | Select Description
    View Group by Mitre ID
    Accepts multiple coma separated values
    Group IDs tab-complete
    Add -Online -> open wiki in browser
    Add -Reference -> view reference
    Add -Reference -Online -> open reference in Browser
.EXAMPLE
    ATTCKGroup -Description "china|chinese" | select name,alias
    View Groups attributed to China
#>
function Get-ATTCKGroup{
    [CmdletBinding(DefaultParameterSetName='Name',HelpURI='https://attack.mitre.org/wiki/Groups')]
    [OutputType([ATTCKGroup])]
    [Alias('ATTCK-Group')]
    Param(
        # Select by Name
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Name,
        # Select by ID
        [Parameter(Mandatory=1,ParameterSetName='ID')][Switch]$ID,
        # Match Description
        [Parameter(Mandatory=1,ParameterSetName='Description')][Switch]$Description,
        # View Reference
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Reference,
        # View Online
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Online
        )
    DynamicParam{
        ## DynDico
        $Dico = New-Object Management.Automation.RuntimeDefinedParameterDictionary
        # If ID
        if($PSCmdlet.ParameterSetName -eq 'ID'){
            $DynID = DynP -Name 'Value' -Type 'String[]' -Mandat 1 -Pos 0 -VSet @($Attck.Group.ID | sort)
            $Dico.Add('Value',$DynID)
            }
        # If Name
        if($PSCmdlet.ParameterSetName -eq 'Name'){
            $DynName = DynP -Name 'Value' -Type 'String[]' -Mandat 0 -Pos 0 -VSet @($attck.group.alias | sort -unique)
            $Dico.Add('Value',$DynName)            
            }
        # If ID
        if($PSCmdlet.ParameterSetName -eq 'Description'){
            $DynDesc = DynP -Name 'match' -Type 'String' -Mandat 1 -Pos 0
            $Dico.Add('match',$DynDesc)
            }
        ## Return Dico
        Return $Dico
        }
    Process{
        ## Get Groups
        $Result = $Attck.Group 
        # Select by ID
        if($PSCmdlet.ParameterSetName -eq 'ID'){
                $Result = @()
                $DynID.value|%{$Result += $Attck.Group  | ? ID -eq $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.Group ;$Url = $Result.Url}
                }
        # Or - Select by Name
        if($PSCmdlet.ParameterSetName -eq 'Name' -AND $DynName.IsSet){
                $Result = @()
                $DynName.value|%{$Result += $Attck.Group  | ? Alias -Contains $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.Reference;$Url = $Result.Url}
                }
        # Or - Match in Description
        if($PSCmdlet.ParameterSetName -eq 'Description'){
                $Result = $Result | ? Description -match $DynDesc.Value
                }
        ## Output
        # If Online > Open URL
        if($Online){
            if(-Not$DynName.IsSet){$url='https://attack.mitre.org/wiki/Groups'}
            $Url|%{try{Start-Process $_}catch{}}
            }
        # Else Return Result
        else{Return $result}
        }}
#####End



################################################
####################################### Software

<#
.Synopsis
   ATT&CK Software
.DESCRIPTION
   ## Action
   - List all Software
   - View Software by name
   - View Software by ID
   - Open ATT&Ck wiki in browser
   - Filter Software by type (tool vs Malware)
   - Match keyword in Software description

   ## Syntax 
   ATTCKSoftware [-Online]
   ATTCKSoftware [-name] [-Value] <tab> [-Online] [-Reference]
   ATTCKSoftware -ID [-Value] <tab> [-Online] [-Reference]
   ATTCKSoftware -Filter [-Type] <tab>
   ATTCKSoftware -Description [-match] <input>
   
   See examples for details 
   PS> Help ATTCKSoftware -Example
.EXAMPLE
    ATTCKSoftware
    List all available software
    Use |Where or |select to filter objects
    Object Properties tab-complete after pipeline :)
.EXAMPLE
    ATTCKSoftware CozyCar 
    View Technique by name
    Accepts multiple coma separated values
    Technique names tab-complete
    Add -online -> open wiki in browser
    Add -reference -> view reference
    Add -reference -online -> open reference in Browser
.EXAMPLE
    ATTCKSoftware -ID S0021
    View Software by Mitre ID
    Accepts multiple coma separated values
    Software IDs tab-complete
    Add -online -> open wiki in browser
    Add -reference -> view reference
    Add -reference -online -> open reference in Browser 
.EXAMPLE
    ATTCKSoftware -Filter malware
    List all software of type malware (vs. tool)
.EXAMPLE
    ATTCKSoftware -Description worm | Select Name,Alias,Description
    Return software matching 'worm' in description
#>
function Get-ATTCKSoftware{
    [CmdletBinding(DefaultParameterSetName='Name',HelpURI='https://attack.mitre.org/wiki/Software')]
    [OutputType([ATTCKSoftware])]
    [Alias('ATTCK-Software')]
    Param(
        # Select by Name
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Name,
        # Select by ID
        [Parameter(Mandatory=1,ParameterSetName='ID')][Switch]$ID,
        # Apply Filters
        [Parameter(Mandatory=1,ParameterSetName='Filter')][Alias('x')][Switch]$Filter,
        # Apply Filters
        [Parameter(Mandatory=1,ParameterSetName='Description')][Switch]$Description,
        # View Reference
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Reference,
        # View Online
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Online
        )
    DynamicParam{
        ## DynDico
        $Dico = New-Object Management.Automation.RuntimeDefinedParameterDictionary
        # If Fitler Type
        if($PSCmdlet.ParameterSetName -eq 'Filter'){
            # Prep DynP
            $DynType = DynP -Name 'Type' -Type 'String' -Mandat 1 -Pos 0 -VSet @($Attck.Software.Type|sort -unique)
            $Dico.Add('Type',$DynType)
            }
        if($PSCmdlet.ParameterSetName -eq 'Description'){
            # Prep DynP
            $DynDesc = DynP -Name 'Match' -Type 'String' -Mandat 1 -Pos 0
            $Dico.Add('Match',$DynDesc)
            }
        # If Select Name
        if($PSCmdlet.ParameterSetName -eq 'ID'){
            $DynID = DynP -Name 'Value' -Type 'String[]' -Mandat 1 -Pos 0 -VSet @($Attck.Software.ID)
            $Dico.Add('Value',$DynID)
            }
        # If Name
        if($PSCmdlet.ParameterSetName -eq 'Name'){
            $DynName = DynP -Name 'Value' -Type 'String[]' -Mandat 0 -Pos 0 -VSet @($Attck.Software.Name)
            $Dico.Add('Value',$DynName)            
            }
        ## Return Dico
        Return $Dico
        }
    Process{
        ## Get Techniques
        $Result = $Attck.Software
        # Filter by Type
        if($PSCmdlet.ParameterSetName -eq 'Filter'){
            $Result = $Result | ? Type -eq $DynType.Value
            }
        # Match Description
        if($PSCmdlet.ParameterSetName -eq 'Description'){
            $Result = $Result | ? Description -match $DynDesc.Value
            }
        # Or - Select by ID
        if($PSCmdlet.ParameterSetName -eq 'ID'){
            if($DynID.IsSet){
                $Result = @()
                $DynID.value|%{$Result += $Attck.Software | ? ID -eq $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.Reference;$Url = $Result.Url}
                }}
        # Or - Select by Name
        if($PSCmdlet.ParameterSetName -eq 'Name'){
            if($DynName.IsSet){
                $Result = @()
                $DynName.value|%{$Result += $Attck.Software | ? Name -eq $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.Reference;$Url = $Result.Url}
                }}
        ## Output
        # If Online > Open URL
        if($Online){
            if(-Not$DynName.IsSet){'https://attack.mitre.org/wiki/Software'}
            $Url|%{try{Start-Process $_}catch{}}
            }
        # Else Return Result
        else{Return $result}
        }}
#####End

################################################
######################################### Tactic

<#
.Synopsis
   ATT&CK Tactics
.DESCRIPTION
   ## Action
   - List all Tactics
   - View Tactic(s) by name
   - View Tactic(s) by ID
   - Open ATT&Ck wiki in browser

   ## Syntax 
   ATTCK-Tactic [-Online]
   ATTCK-Tactic [-name] [-Value] <tab> [-Online] [-Reference]
   ATTCK-Tactic -ID [-Value] <tab> [-Online] [-Reference]

   See examples for details 
   PS> Help ATTCK-Tactic -Example
.EXAMPLE
    ATTCK-Tactic
    List all available Groups
    Use |Where or |select to filter objects
    Object Properties tab-complete after pipeline :)
.EXAMPLE
    ATTCK-Tactic impact
    View Tactic by name
    Accepts multiple coma separated values
    Tactic names tab-complete
    Add -Online -> open wiki in browser
    Add -Reference -> view reference
    Add -Reference -Online -> open reference in Browser
.EXAMPLE
    ATTCK-Tactic -ID TA0001 | Select Description
    View Group by Mitre ID
    Accepts multiple coma separated values
    Tactic IDs tab-complete
    Add -Online -> open wiki in browser
    Add -Reference -> view reference
    Add -Reference -Online -> open reference in Browser
#>
function Get-ATTCKTactic{
    [CmdletBinding(DefaultParameterSetName='Name',HelpURI='https://attack.mitre.org/tactics/enterprise/')]
    [OutputType([ATTCKTactic])]
    [Alias('ATTCK-Tactic')]
    Param(
        # Select by Name
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Name,
        # Select by ID
        [Parameter(Mandatory=1,ParameterSetName='ID')][Switch]$ID,
        # View Reference
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Reference,
        # View Online
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Online
        )
    DynamicParam{
        ## DynDico
        $Dico = New-Object Management.Automation.RuntimeDefinedParameterDictionary
        # If ID
        if($PSCmdlet.ParameterSetName -eq 'ID'){
            $DynID = DynP -Name 'Value' -Type 'String[]' -Mandat 1 -Pos 0 -VSet @($Attck.Tactic.ID | sort -Unique)
            $Dico.Add('Value',$DynID)
            }
        # If Name
        if($PSCmdlet.ParameterSetName -eq 'Name'){
            $DynName = DynP -Name 'Value' -Type 'String[]' -Mandat 0 -Pos 0 -VSet @($attck.Tactic.name | sort -unique)
            $Dico.Add('Value',$DynName)            
            }
        ## Return Dico
        Return $Dico
        }
    Process{
        ## Get Groups
        $Result = $Attck.Tactic 
        # Select by ID
        if($PSCmdlet.ParameterSetName -eq 'ID'){
                $Result = @()
                $DynID.value|%{$Result += $Attck.Tactic  | ? ID -eq $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.Tactic ;$Url = $Result.Url}
                }
        # Or - Select by Name
        if($PSCmdlet.ParameterSetName -eq 'Name' -AND $DynName.IsSet){
                $Result = @()
                $DynName.value|%{$Result += $Attck.Tactic  | ? name -eq $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.Reference;$Url = $Result.Url}
                }
        ## Output
        # If Online > Open URL
        if($Online){
            if(-Not$DynName.IsSet){$url='https://attack.mitre.org/tactics/enterprise/'}
            $Url|%{try{Start-Process $_}catch{}}
            }
        # Else Return Result
        else{Return $result}
        }}
#####End


# ATTCK-Usage -Map Group_Using_Technique -Name <name>
# ATTCK-Usage -Map Group_Using_Software -Name <name>
# ATTCK-Usage -Map Software_Using_Technique -Name <name>
# ATTCK-Usage -Map Software_UsedBy_Group -Name <name>
# ATTCK-Usage -Map Technique_UsedBy_Group -Name <name>
# ATTCK-Usage -Map Technique_Usedby_Software -Name <name>


Function Get-ATTCKUsage{
    [Alias('ATTCK-Usage','Map')]
    Param(
        [ValidateSet('Group_Using_Technique','Group_Using_Software','Software_Using_Technique','Software_UsedBy_Group','Technique_UsedBy_Group','Technique_Usedby_Software')]
        [Parameter(Mandatory=1,Position=0)][String]$Map
        )
        DynamicParam{
        # Switch ValidateSet 
        Switch($Map){
            'Group_Using_Technique'    {$VSet=$attck.Technique.name|Sort -unique}
            'Group_Using_Software'     {$VSet=$attck.Software.alias|Sort -unique}
            'Software_Using_Technique' {$VSet=$attck.Technique.name|Sort -unique}
            'Software_UsedBy_Group'    {$VSet=$attck.Group.alias   |Sort -unique}
            'Technique_UsedBy_Group'   {$VSet=$attck.Group.alias   |Sort -unique}
            'Technique_Usedby_Software'{$VSet=$attck.Software.alias|Sort -unique}           
            }
        # Dico
        $Dico = New-Object Management.Automation.RuntimeDefinedParameterDictionary
        # DynPs
        $DynName = DynP -Name 'Name' -Type 'String' -Mandat 1 -Pos 1 -VSet $Vset
        $DynDesc = DynP -Name 'Describe' -type 'Switch' -Mandat 0 -Pos 2
        # Return
        $Dico.Add('Name',$DynName)
        $dico.Add('Describe',$DynDesc)
        Return $Dico
        }
    Process{
        $InType  = $Map.split('_')[2]
        $EdgeDir = $Map.split('_')[1]
        $OutType = $Map.split('_')[0]
        if($InType -eq 'Technique'){$Prop='name'}else{$Prop='alias'}
        #if($OutType -match "ID$"){$Prop='ID'; $OutType=$outype-replace"(ID$)",''}
        # InputObj name to STIX
        $Search = $ATTCK.$InType | Where $Prop -eq $DynName.Value
        # RelationShip direction
        If($EdgeDir -eq 'Using'){$a='Target';$B='Source'}Else{$a='Source';$b='Target'}
        # For each edge matching Search stix
        Foreach($Rel in ($ATTCK.Relationship | Where $a -eq $Search.stix | Where Edge -eq uses)){
            $SearchSTIX=$Rel.$b
            if($Rel.description){$Desc = $rel.description}else{$desc=$null}
            # Return OutputObj by STIX
            $Found = $ATTCK.$OutType | where {$_.stix -eq $SearchSTIX} 
            if($edgeDir -eq "UsedBy"){$Src=$Search.Name;$tgt=$Found.Name}else{$Src=$Found.Name;$tgt=$Search.Name}
            if($DynDesc.value -AND $Found.Name){
                Return [PSCustomObject]@{
                    Source     = $Search.Name
                    Edge       = 'Uses'
                    Target     = $Found.Name
                    Description= $Desc
                    Reference  = $Rel.reference
                    }}
            else{Return $Found}
            }}}
#########End


#endregion

#region PRE

###################################### Technique_PRE

<#
.Synopsis
   ATT&CK Techniques
.DESCRIPTION
   ## Action
   - List all Techniques
   - View Technique(s) by name
   - View Technique(s) by ID
   - Open ATT&Ck wiki in browser
   - Filter Technique by Tactic/Platform/Context
   - Search Keyword in description

   ## Syntax 
   ATTCKTechnique [-Online]
   ATTCKTechnique [-name] [-Value] <tab> [-Online] [-Reference]
   ATTCKTechnique -ID [-Value] <tab> [-Online] [-Reference]
   ATTCKTechnique -Filter [[-Tactic] <tab>] [[-Platform] <tab>] [[-Permission] <tab>]
   ATTCKTechnique -Description [-Match] <input>
   
   See examples for details 
   PS> Help ATTCKTechnique -Example
.EXAMPLE
    ATTCKTechnique
    List all available techniques
    Use |Where or |select to filter objects
    Object Properties tab-complete after pipeline :)
.EXAMPLE
    ATTCKTechnique AppleScript
    View Technique by name
    Accepts multiple coma separated values
    Technique names tab-complete
    Add -online -> open wiki in browser
    Add -reference -> view reference
    Add -reference -online -> open reference in Browser
.EXAMPLE
    ATTCKTechnique -ID T1001
    View Technique by Mitre ID
    Accepts multiple coma separated values
    Technique IDs tab-complete
    Add -online -> open wiki in browser
    Add -reference -> view reference
    Add -reference -online -> open reference in Browser
.EXAMPLE
    ATTCKTechnique -Description 'Subtee'
    View Techniques where desciption match 'Subtee' 
.EXAMPLE
    ATTCKTechnique -Filter lateral-movement macOS root
    List macOS lateral mvt techniques that require root
    Can filter on Tactic/Platform/Permission
    (positional in this order or named params)
    All tab-completes
#>
function Get-ATTCKTechniquePRE{
    [CmdletBinding(DefaultParameterSetName='Name',HelpURI='https://attack.mitre.org/wiki/All_Techniques')]
    [OutputType([ATTCKTechniquePRE])]
    [Alias('PRE_ATTCK-Technique','PRE')]
    Param(
        # Select by Name
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Name,
        # Select by ID
        [Parameter(Mandatory=1,ParameterSetName='ID')][Switch]$ID,
        # Apply Filters
        [Parameter(Mandatory=1,ParameterSetName='Filter')][Alias('x')][Switch]$Filter,
        # Match Description
        [Parameter(Mandatory=1,ParameterSetName='Description')][Switch]$Description,
        # View Reference
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Reference,
        # View Online
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Online
        )
    DynamicParam{
        ## DynDico
        $Dico = New-Object Management.Automation.RuntimeDefinedParameterDictionary
        # If Fitler
        if($PSCmdlet.ParameterSetName -eq 'Filter'){
            # Prep DynP
            $DynTact = DynP -Name 'Tactic'     -Type 'String[]' -Pos 0 -VSet @($Attck.TechniquePRE.Tactic|sort -unique)
            $DynPlat = DynP -Name 'Platform'   -Type 'String[]' -Pos 1 -VSet @($Attck.TechniquePRE.Platform|sort -unique)
            $DynPerm = DynP -Name 'Permission' -Type 'String[]' -Pos 2 -VSet @($Attck.TechniquePRE.Permission|sort -unique)
            # DynP to Dico
            $Dico.Add('Tactic',$DynTact)
            $Dico.Add('Platform',$DynPlat)
            $Dico.Add('Permission',$DynPerm)
            }
        # If Description
        Elseif($PSCmdlet.ParameterSetName -eq 'Description'){
            $DynDesc = DynP -Name 'Match' -Type 'string' -mandat 1 -Pos 0
            $Dico.Add('Match',$DynDesc)
            }
        # Else
        else{# If ID
            if($PSCmdlet.ParameterSetName -eq 'ID'){
                $DynID = DynP -Name 'Value' -Type 'String[]' -Mandat 1 -Pos 0 -VSet @($Attck.TechniquePRE.ID)
                $Dico.Add('Value',$DynID)
                }
            # If Name
            if($PSCmdlet.ParameterSetName -eq 'Name'){
                $DynName = DynP -Name 'Value' -Type 'String[]' -Mandat 0 -Pos 0 -VSet @($Attck.TechniquePRE.Name)
                $Dico.Add('Value',$DynName)            
                }}
        ## Return Dico
        Return $Dico
        }
    Process{
        ## Get Techniques
        $Result = $Attck.TechniquePRE 
        # Apply Filters
        if($PSCmdlet.ParameterSetName -eq 'Filter'){
            if($PSBoundParameters.Tactic){$Result = $Result | ? tactic -match "$($PSBoundParameters.Tactic-join'|')"}
            if($PSBoundParameters.Platform){$Result = $Result | ? Platform -match "$($PSBoundParameters.Platform-join'|')"}
            if($PSBoundParameters.Permission){$Result = $Result | ? Permission -match "$($PSBoundParameters.Permission-join'|')"}
            }
        # Match in Description
        if($PScmdlet.ParameterSetName -eq 'Description'){$DynDesc.value
            $Result = $Result | ? Description -match $DynDesc.value
            }
        # Or - Select by ID
        if($PSCmdlet.ParameterSetName -eq 'ID'){
            if($DynID.IsSet){
                $Result = @()
                $DynID.value|%{$Result += $Attck.TechniquePRE | ? ID -eq $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.Reference;$Url = $Result.Url}
                }}
        # Or - Select by Name
        if($PSCmdlet.ParameterSetName -eq 'Name'){
            if($DynName.IsSet){
                $Result = @()
                $DynName.value|%{$Result += $Attck.TechniquePRE | ? Name -eq $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.Reference;$Url = $Result.Url}
                }}
        ## Output
        # If Online > Open URL
        if($Online){
            if(-Not$DynName.IsSet){$url='https://attack.mitre.org/wiki/All_Techniques'}
            $Url|%{try{Start-Process $_}catch{}}
            }
        # Else Return Result
        else{Return $result}
        }}
#####End



################################################
########################################## Group

<#
.Synopsis
   ATT&CK Groups
.DESCRIPTION
   ## Action
   - List all Groups
   - View Group(s) by name
   - View Group(s) by ID
   - Open ATT&Ck wiki in browser
   - Match keyword in Group description

   ## Syntax 
   ATTCK-Group [-Online]
   ATTCK-Group [-name] [-Value] <tab> [-Online] [-Reference]
   ATTCK-Group -ID [-Value] <tab> [-Online] [-Reference]
   ATTCK-Group -Description [-Match] <input>

   See examples for details 
   PS> Help ATTCK-Group -Example
.EXAMPLE
    ATTCKGroup
    List all available Groups
    Use |Where or |select to filter objects
    Object Properties tab-complete after pipeline :)
.EXAMPLE
    ATTCK-Group admin@338
    View Group by name/alias
    Accepts multiple coma separated values
    Group names tab-complete
    Add -Online -> open wiki in browser
    Add -Reference -> view reference
    Add -Reference -Online -> open reference in Browser
.EXAMPLE
    ATTCK-Group -ID G0023 | Select Description
    View Group by Mitre ID
    Accepts multiple coma separated values
    Group IDs tab-complete
    Add -Online -> open wiki in browser
    Add -Reference -> view reference
    Add -Reference -Online -> open reference in Browser
.EXAMPLE
    ATTCKGroup -Description "china|chinese" | select name,alias
    View Groups attributed to China
#>
function Get-ATTCKGroupPRE{
    [CmdletBinding(DefaultParameterSetName='Name',HelpURI='https://attack.mitre.org/wiki/Groups')]
    [OutputType([ATTCKGroupPRE])]
    [Alias('PRE-Group')]
    Param(
        # Select by Name
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Name,
        # Select by ID
        [Parameter(Mandatory=1,ParameterSetName='ID')][Switch]$ID,
        # Match Description
        [Parameter(Mandatory=1,ParameterSetName='Description')][Switch]$Description,
        # View Reference
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Reference,
        # View Online
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Online
        )
    DynamicParam{
        ## DynDico
        $Dico = New-Object Management.Automation.RuntimeDefinedParameterDictionary
        # If ID
        if($PSCmdlet.ParameterSetName -eq 'ID'){
            $DynID = DynP -Name 'Value' -Type 'String[]' -Mandat 1 -Pos 0 -VSet @($Attck.GroupPRE.ID | sort)
            $Dico.Add('Value',$DynID)
            }
        # If Name
        if($PSCmdlet.ParameterSetName -eq 'Name'){
            $DynName = DynP -Name 'Value' -Type 'String[]' -Mandat 0 -Pos 0 -VSet @($attck.groupPRE.Name | sort -unique)
            $Dico.Add('Value',$DynName)            
            }
        # If ID
        if($PSCmdlet.ParameterSetName -eq 'Description'){
            $DynDesc = DynP -Name 'match' -Type 'String' -Mandat 1 -Pos 0
            $Dico.Add('match',$DynDesc)
            }
        ## Return Dico
        Return $Dico
        }
    Process{
        ## Get Groups
        $Result = $Attck.Group | where ID -In $Attck.GroupPRE.ID
        # Select by ID
        if($PSCmdlet.ParameterSetName -eq 'ID'){
                $Result = @()
                $DynID.value|%{$Result += $Attck.Group  | ? ID -eq $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.Group ;$Url = $Result.Url}
                }
        # Or - Select by Name
        if($PSCmdlet.ParameterSetName -eq 'Name' -AND $DynName.IsSet){
                $Result = @()
                $DynName.value|%{$Result += $Attck.Group  | ? Alias -Contains $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.Reference;$Url = $Result.Url}
                }
        # Or - Match in Description
        if($PSCmdlet.ParameterSetName -eq 'Description'){
                $Result = $Result | ? Description -match $DynDesc.Value
                }
        ## Output
        # If Online > Open URL
        if($Online){
            if(-Not$DynName.IsSet){$url='https://attack.mitre.org/wiki/Groups'}
            $Url|%{try{Start-Process $_}catch{}}
            }
        # Else Return Result
        else{Return $result}
        }}
#####End


################################################
######################################### Tactic

<#
.Synopsis
   ATT&CK Tactics
.DESCRIPTION
   ## Action
   - List all Tactics
   - View Tactic(s) by name
   - View Tactic(s) by ID
   - Open ATT&Ck wiki in browser

   ## Syntax 
   ATTCK-Tactic [-Online]
   ATTCK-Tactic [-name] [-Value] <tab> [-Online] [-Reference]
   ATTCK-Tactic -ID [-Value] <tab> [-Online] [-Reference]

   See examples for details 
   PS> Help ATTCK-Tactic -Example
.EXAMPLE
    ATTCK-Tactic
    List all available Groups
    Use |Where or |select to filter objects
    Object Properties tab-complete after pipeline :)
.EXAMPLE
    ATTCK-Tactic impact
    View Tactic by name
    Accepts multiple coma separated values
    Tactic names tab-complete
    Add -Online -> open wiki in browser
    Add -Reference -> view reference
    Add -Reference -Online -> open reference in Browser
.EXAMPLE
    ATTCK-Tactic -ID TA0001 | Select Description
    View Group by Mitre ID
    Accepts multiple coma separated values
    Tactic IDs tab-complete
    Add -Online -> open wiki in browser
    Add -Reference -> view reference
    Add -Reference -Online -> open reference in Browser
#>
function Get-ATTCKTacticPRE{
    [CmdletBinding(DefaultParameterSetName='Name',HelpURI='https://attack.mitre.org/tactics/enterprise/')]
    [OutputType([ATTCKTacticPRE])]
    [Alias('PRE-Tactic')]
    Param(
        # Select by Name
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Name,
        # Select by ID
        [Parameter(Mandatory=1,ParameterSetName='ID')][Switch]$ID,
        # View Reference
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Reference,
        # View Online
        [Parameter(Mandatory=0,ParameterSetName='ID')]
        [Parameter(Mandatory=0,ParameterSetName='Name')][Switch]$Online
        )
    DynamicParam{
        ## DynDico
        $Dico = New-Object Management.Automation.RuntimeDefinedParameterDictionary
        # If ID
        if($PSCmdlet.ParameterSetName -eq 'ID'){
            $DynID = DynP -Name 'Value' -Type 'String[]' -Mandat 1 -Pos 0 -VSet @($Attck.TacticPRE.ID | sort -Unique)
            $Dico.Add('Value',$DynID)
            }
        # If Name
        if($PSCmdlet.ParameterSetName -eq 'Name'){
            $DynName = DynP -Name 'Value' -Type 'String[]' -Mandat 0 -Pos 0 -VSet @($attck.TacticPRE.name | sort -unique)
            $Dico.Add('Value',$DynName)            
            }
        ## Return Dico
        Return $Dico
        }
    Process{
        ## Get Groups
        $Result = $Attck.TacticPRE 
        # Select by ID
        if($PSCmdlet.ParameterSetName -eq 'ID'){
                $Result = @()
                $DynID.value|%{$Result += $Attck.TacticPRE  | ? ID -eq $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.TacticPRE ;$Url = $Result.Url}
                }
        # Or - Select by Name
        if($PSCmdlet.ParameterSetName -eq 'Name' -AND $DynName.IsSet){
                $Result = @()
                $DynName.value|%{$Result += $Attck.TacticPRE  | ? name -eq $_}
                $Url = $Result.Wiki
                if($Reference){$Result=$Result.Reference;$Url = $Result.Url}
                }
        ## Output
        # If Online > Open URL
        if($Online){
            if(-Not$DynName.IsSet){$url='https://attack.mitre.org/tactics/enterprise/'}
            $Url|%{try{Start-Process $_}catch{}}
            }
        # Else Return Result
        else{Return $result}
        }}
#####End


# ATTCK-Usage -Map Group_Using_Technique -Name <name>
# ATTCK-Usage -Map Group_Using_Software -Name <name>
# ATTCK-Usage -Map Software_Using_Technique -Name <name>
# ATTCK-Usage -Map Software_UsedBy_Group -Name <name>
# ATTCK-Usage -Map Technique_UsedBy_Group -Name <name>
# ATTCK-Usage -Map Technique_Usedby_Software -Name <name>


Function Get-ATTCKUsagePRE{
    [Alias('PRE-Usage')]
    Param(
        [ValidateSet('Group_Using_Technique','Technique_UsedBy_Group')]
        [Parameter(Mandatory=1,Position=0)][String]$Map
        )
        DynamicParam{
        # Switch ValidateSet 
        Switch($Map){
            'Group_Using_Technique'    {$VSet=$attck.TechniquePRE.name|Sort -unique}
            'Technique_UsedBy_Group'   {$VSet=$attck.GroupPRE.name    |Sort -unique}         
            }
        # Dico
        $Dico = New-Object Management.Automation.RuntimeDefinedParameterDictionary
        # DynPs
        $DynName = DynP -Name 'Name' -Type 'String' -Mandat 1 -Pos 1 -VSet $Vset
        $DynDesc = DynP -Name 'Describe' -type 'Switch' -Mandat 0 -Pos 2
        # Return
        $Dico.Add('Name',$DynName)
        $dico.Add('Describe',$DynDesc)
        Return $Dico
        }
    Process{
        $InType  = $Map.split('_')[2]
        $EdgeDir = $Map.split('_')[1]
        $OutType = $Map.split('_')[0]
        if($InType -eq 'Technique'){$Prop='name'}else{$Prop='name'}
        #if($OutType -match "ID$"){$Prop='ID'; $OutType=$outype-replace"(ID$)",''}
        # InputObj name to STIX
        $Search = $ATTCK."${InType}PRE" | Where $Prop -eq $DynName.Value
        # RelationShip direction
        If($EdgeDir -eq 'Using'){$a='Target';$B='Source'}Else{$a='Source';$b='Target'}
        # For each edge matching Search stix
        Foreach($Rel in ($ATTCK.RelationshipPRE | Where $a -eq $Search.stix | Where Edge -eq uses)){
            $SearchSTIX=$Rel.$b
            if($Rel.description){$Desc = $rel.description}else{$desc=$null}
            # Return OutputObj by STIX
            $Found = $ATTCK.$OutType | where {$_.stix -eq $SearchSTIX} 
            if($edgeDir -eq "UsedBy"){$Src=$Search.Name;$tgt=$Found.Name}else{$Src=$Found.Name;$tgt=$Search.Name}
            if($DynDesc.value -AND $Found.Name){
                Return [PSCustomObject]@{
                    Source     = $Search.Name
                    Edge       = 'Uses'
                    Target     = $Found.Name
                    Description= $Desc
                    Reference  = $Rel.reference
                    }}
            else{Return $Found}
            }}}
#########End

#endregion

#region MOB

<#MOB stuff#>

#endregion



########################################### LOAD
if(-Not$ATTCK.Technique.count){Invoke-ATTCKnowledge -sync -verbose}

################################################
############################################ EOF
