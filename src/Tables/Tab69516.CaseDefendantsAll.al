
table 69516 "Case Defendants All"
{
    // DrillDownPageID = "Defendants All";
    // LookupPageID = "Defendants All";
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[100])
        {
        }
        field(2; Type; Option)
        {
            OptionCaption = ' ,Plaintiff,Defendant';
            OptionMembers = " ",Plaintiff,Defendant;
        }
        field(3; Names; Code[250])
        {
        }
        field(4; Contacts; Code[250])
        {
        }
        field(5; "No. Series"; Code[40])
        {
        }
        field(6; "First Name"; Text[30])
        {
        }
        field(7; "Second Name"; Text[30])
        {
        }
        field(8; "Last name"; Text[30])
        {
        }
        field(9; Email; Text[30])
        {
        }
        field(10; Address; Text[30])
        {
        }
        field(11; "Postal Code"; Code[10])
        {
        }
        field(12; City; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; No, Names)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Type := Type::Defendant;

        if No = '' then begin
            HumanResourcesSetup.Get;
            HumanResourcesSetup.TestField("Defendant Nos");
            NoSeriesManagement.InitSeries(HumanResourcesSetup."Defendant Nos", xRec."No. Series", Today, No, "No. Series");
        end;
    end;

    trigger OnModify()
    begin
        //Names:="First Name"+"Middle Name"+"Last name";
        /*
        IF No <> xRec.No THEN BEGIN
          HumanResourcesSetup.GET;
          NoSeriesManagement.TestManual(HumanResourcesSetup."Defendant Nos");
           "No. Series" := '';
          END;
          */

    end;

    var
        Plantiff: Record "Plaintive-Defentants";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PostCode: Record "Post Code";
        Country: Record "Country/Region";
        County: Text;
}

