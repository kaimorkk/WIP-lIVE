
table 69171 "Training Courses Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }


        field(2; Descritpion; Text[100])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
        field(4; Domain; Code[30])
        {
            TableRelation = "Training Domains";
            trigger OnValidate()
            var
                TD: Record "Training Domains";
            begin
                if TD.Get(Domain) then
                    "Domain Name" := TD.Description;
            end;
        }
        field(5; "No. of Staff Trained"; Integer)
        {
        }
        field(6; "Budget Spent"; Decimal)
        {
        }
        field(7; "Qualification Code"; Code[30])
        {
            TableRelation = Qualification;

            trigger OnValidate()
            begin
                Qualification.Reset;
                Qualification.SetRange(Code, "Qualification Code");
                if Qualification.FindFirst then begin
                    "Qualification Name" := Qualification.Description;
                end
            end;
        }
        field(8; "Qualification Name"; Text[50])
        {
            Editable = false;
        }
        field(9; "Skill Type"; Integer)
        {
            TableRelation = Reasons;
            trigger OnValidate()
            var
                Reasons: Record Reasons;
            begin
                if Reasons.Get("Skill Type") then
                    "Skill Description" := Reasons.Description;
            end;
        }
        field(10; "Skill Description"; Text[80])
        {
        }
        field(11; "Course Duration"; DateFormula)
        {
        }
        field(12; "Domain Name"; Text[100])
        {
        }
        field(13; Bonded; Boolean)
        {
        }
        field(14; "Bonding Period"; DateFormula)
        {
            trigger OnValidate()
            begin
                TestField(Bonded, true);
            end;
        }
        field(15; "Bonding Penalty"; Decimal)
        {
            trigger OnValidate()
            begin
                TestField(Bonded, true);
            end;
        }
        field(16; Trainer; Code[20])
        {
            TableRelation = Vendor /*where(Trainer = const(true))*/;
            trigger OnValidate()
            var
                Vend: Record Vendor;
            begin
                Vend.Get(Trainer);
                "Trainer Name" := Vend.Name;
            end;
        }
        field(17; "Trainer Name"; Text[100])
        {
            Editable = false;
        }
        field(18; LMS; Boolean)
        {
        }
        field(19; Synched; Boolean)
        {
        }

        field(20; "No. Series"; Code[20])
        {

        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Descritpion)
        {
        }
    }

    var
        Qualification: Record Qualification;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";

    trigger OnInsert()
    begin
        // if "Code" = '' then begin
        //     HRSetup.Get();
        //     HRSetup.TestField(HRSetup."Training Course Nos");
        //     NoSeriesMgt.InitSeries(HRSetup."Training Course Nos", xRec."No. Series", 0D, "Code", "No. Series");
        // end;
    end;
}

