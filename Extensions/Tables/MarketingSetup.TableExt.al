TableExtension 52193659 tableextension52193659 extends "Marketing Setup" 
{
    fields
    {

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Campaign Nos."(Field 3)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Opportunity Nos."(Field 6)".


        //Unsupported feature: Deletion (FieldCollection) on ""Exchange Service URL"(Field 71)".


        //Unsupported feature: Deletion (FieldCollection) on ""Exchange Account User Name"(Field 72)".


        //Unsupported feature: Deletion (FieldCollection) on ""Exchange Account Password Key"(Field 73)".

        field(50000;"Survey Nos";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50001;"Visiting Nos";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50002;"Agenda Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50003;"Publication Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50004;"Complains Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50005;"Event Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50006;"Meeting Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50007;"Committee Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50008;"ExternalCom Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50009;"Briefing Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50010;"Media Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50011;"ExVisit Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50012;"Sms Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
    }

    //Unsupported feature: Property Deletion (Permissions).



    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1004)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text006 : ENU=Integration with the Connector for Microsoft Dynamics is enabled.;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text006 : ENU=Integration with the Connector for Microsoft Dynamics is enabled.\The Microsoft Dynamics NAV service should be restarted.;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1007)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text008 : ENU=Integration with the Connector for Microsoft Dynamics is disabled.;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text008 : ENU=Integration with the Connector for Microsoft Dynamics is disabled.\The Microsoft Dynamics NAV service should be restarted.;
        //Variable type has not been exported.

    var
        Text000: label 'Please restart the e-mail dispatcher for changes to take effect.';
        Text003: label 'The Search Index Mode has been modified.\All search areas must be reindexed.\Start reindexing now?';
}

