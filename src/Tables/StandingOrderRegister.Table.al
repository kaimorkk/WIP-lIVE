Table 52193508 "Standing Order Register"
{
    DrillDownPageID = "Standing Order Register";
    LookupPageID = "Standing Order Register";

    fields
    {
        field(1; "Register No."; Code[20])
        {

            trigger OnValidate()
            begin
                if "Register No." <> xRec."Register No." then begin
                    NoSetup.Get();
                    NoSeriesMgt.TestManual(NoSetup."STO Register No");
                    "No. Series" := '';
                end;

                if "Register No." = '' then begin
                    NoSetup.Get();
                    NoSetup.TestField(NoSetup."STO Register No");
                    NoSeriesMgt.InitSeries(NoSetup."STO Register No", xRec."No. Series", 0D, "Register No.", "No. Series");
                end;
            end;
        }
        field(2; "Source Account No."; Code[20])
        {
            NotBlank = true;
            TableRelation = Vendor."No.";
        }
        field(3; "Staff/Payroll No."; Code[20])
        {
        }
        field(4; "Account Name"; Text[50])
        {
        }
        field(5; "Destination Account Type"; Option)
        {
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(6; "Destination Account No."; Code[20])
        {
            // TableRelation = if ("Destination Account Type" = const(Internal)) Vendor."No." where("Creditor Type" = const(Account));
        }
        field(7; "Destination Account Name"; Text[50])
        {
        }
        field(8; "BOSA Account No."; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(9; "Effective/Start Date"; Date)
        {
        }
        field(10; "End Date"; Date)
        {
        }
        field(11; Duration; DateFormula)
        {
            NotBlank = true;
        }
        field(12; Frequency; DateFormula)
        {
            NotBlank = true;
        }
        field(13; "Don't Allow Partial Deduction"; Boolean)
        {
        }
        field(14; "Deduction Status"; Option)
        {
            Editable = false;
            OptionCaption = 'Successfull,Partial Deduction,Failed';
            OptionMembers = Successfull,"Partial Deduction",Failed;
        }
        field(15; Remarks; Text[50])
        {
        }
        field(16; Amount; Decimal)
        {
            NotBlank = true;
        }
        field(17; "Amount Deducted"; Decimal)
        {
        }
        field(18; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(19; Date; Date)
        {
        }
        field(20; EFT; Boolean)
        {
        }
        field(21; "Transfered to EFT"; Boolean)
        {
        }
        field(22; "Standing Order No."; Code[20])
        {
            TableRelation = "Standing Orders"."No.";
        }
        field(23; Bolibeng; Boolean)
        {
        }
        field(33; "Last Run Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Register No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Register No." = '' then begin
            NoSetup.Get();
            NoSetup.TestField(NoSetup."STO Register No");
            NoSeriesMgt.InitSeries(NoSetup."STO Register No", xRec."No. Series", 0D, "Register No.", "No. Series");
        end;
    end;

    var
        NoSetup: Record "Fosa Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

