﻿##############################################################################
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
##############################################################################
[T4Scaffolding.Scaffolder(Description = "Injects all the Dependencies of the Models")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-NamespacesToHost $Project

##############################################################
# register the service to ninject
##############################################################
foreach($ns in @("Core.Interfaces.Data", "Core.Interfaces.Service", "Data", "Service")){
	$toadd = $namespace + "." + $ns
	Add-Namespace (Get-Project $Project).Name "\App_Start\" "NinjectMVC3.cs" $toadd
}

##############################################################
# register the interfaces and instances to ninject
##############################################################
$namespaces = $DTE.Documents | ForEach{$_.ProjectItem.FileCodeModel.CodeElements | Where-Object{$_.Kind -eq 5}}
	
$classes = $namespaces | ForEach{$_.Children}

$classes | ForEach{
	$current = $_
	$_.Bases | ForEach{
		if($_.Name -eq "PersistentEntity"){
			Scaffold WC.Ninject.For $current.Name -Force:$Force
		}
	}		
}