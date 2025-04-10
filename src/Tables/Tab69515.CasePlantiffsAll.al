
table 69515 "Case Plantiffs All"
{
    DrillDownPageID = "Plaintiffs All";
    LookupPageID = "Plaintiffs All";
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[100])
        {

            // trigger OnValidate()
            // begin
            //     if No <> xRec.No then begin
            //         HumanResourcesSetup.Get;
            //         NoSeriesManagement.TestManual(HumanResourcesSetup."Plaintiff Nos");
            //         "No. Series" := '';
            //     end;
            // end;
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
        field(6; "Source Contact Code"; Code[10])
        {
            TableRelation = Contact."No." where("Company No." = field(No));
        }
        field(7; Address; Text[30])
        {
        }
        field(8; "Postal Code"; Code[10])
        {
        }
        field(9; City; Text[30])
        {
        }
        field(10; Email; Text[30])
        {
        }
        field(11; "First Name"; Text[30])
        {
        }
        field(12; "Second Name"; Text[30])
        {
        }
        field(13; "Last Name"; Text[30])
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
        Type := Type::Plaintiff;

        // if No = '' then begin
        //     HumanResourcesSetup.Get;
        //     HumanResourcesSetup.TestField("Plaintiff Nos");
        //     NoSeriesManagement.InitSeries(HumanResourcesSetup."Plaintiff Nos", xRec."No. Series", 0D, No, "No. Series");
        // end;
    end;

    var
        Plantiff: Record "Plaintive-Defentants";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        HumanResourcesSetup: Record "Human Resources Setup";
}

