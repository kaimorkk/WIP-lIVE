Table 52193507 "Standing Orders"
{
    DrillDownPageID = "Standing Order List";
    LookupPageID = "Standing Order List";

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    NoSetup.Get();
                    NoSeriesMgt.TestManual(NoSetup."Standing Orders Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Source Account No."; Code[20])
        {
            // TableRelation = Vendor."No." where("Debtor Type" = filter("FOSA Account"));

            trigger OnValidate()
            begin
                if Account.Get("Source Account No.") then begin

                    "Account Name" := Account.Name;

                end;
            end;
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

            trigger OnValidate()
            begin
                if "Destination Account Type" = "destination account type"::Internal then begin
                    "Don't Allow Partial Deduction" := true
                end else
                    "Don't Allow Partial Deduction" := false;
            end;
        }
        field(6; "Destination Account No."; Code[50])
        {
            // TableRelation = if ("Destination Account Type" = const(Internal)) Vendor."No." where("Debtor Type" = const("FOSA Account"))
            // else if ("Destination Account Type" = const(External)) "G/L Account";

            trigger OnValidate()
            begin
                /*IF "Destination Account Type" = "Destination Account Type"::External THEN
                ERROR('Not applicable for BOSA Standing Orders.');*/

                /*CASE "Destination Account Type" OF
                 "Destination Account Type"::External:
                  BEGIN
                   IF FORM.RUNMODAL(18,GLAccount)=ACTION::LookupOK THEN BEGIN
                      GLAccount.TESTFIELD(GLAccount."Direct Posting",TRUE);
                     "Destination Account No.":=GLAccount."No.";
                     "Destination Account Name":=GLAccount.Name;
                   END;
                  END;
                END;*/


                if Account.Get("Destination Account No.") then begin
                    "Destination Account Name" := Account.Name;
                    if ("Destination Account Type" = "destination account type"::Internal) and ("Source Account No." = "Destination Account No.") then
                        Error((Text001), "Source Account No.", "Destination Account No.");

                end;

            end;
        }
        field(7; "Destination Account Name"; Text[50])
        {

            trigger OnValidate()
            begin
                if "Destination Account Type" = "destination account type"::External then
                    Error('Not applicable for BOSA Standing Orders.');
            end;
        }
        field(8; "BOSA Account No."; Code[20])
        {
            // TableRelation = Customer."No." where("Customer Type" = filter(Member | FOSA));
        }
        field(9; "Effective/Start Date"; Date)
        {

            trigger OnValidate()
            begin
                "Next Run Date" := "Effective/Start Date";
            end;
        }
        field(10; "End Date"; Date)
        {
        }
        field(11; Duration; DateFormula)
        {

            trigger OnValidate()
            begin
                TestField("Effective/Start Date");
                TestField(Duration);
                "End Date" := CalcDate(Duration, "Effective/Start Date");
            end;
        }
        field(12; Frequency; DateFormula)
        {
        }
        field(13; "Don't Allow Partial Deduction"; Boolean)
        {
        }
        field(14; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Released,Active,Stopped,Rejected,Canceled';
            OptionMembers = Open,"Pending Approval",Released,Active,Stopped,Rejected,Canceled;
        }
        field(15; Remarks; Text[50])
        {
        }
        field(16; Amount; Decimal)
        {
        }
        field(17; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(18; "Bank Code"; Code[20])
        {
            TableRelation = Banks.Code;

            trigger OnValidate()
            begin
                /*
                IF BanksList.GET("Bank Code") THEN BEGIN
                "Bank Name":=BanksList."Bank Name";
                "Branch Name":=BanksList.Branch;
                END;
                */

            end;
        }
        field(19; "Transacting Branch"; Code[20])
        {
        }
        field(20; "Allocated Amount"; Decimal)
        {
            Editable = false;
        }
        field(21; Unsuccessfull; Boolean)
        {
        }
        field(22; Balance; Decimal)
        {
        }
        field(23; Effected; Boolean)
        {
        }
        field(24; "Next Run Date"; Date)
        {
        }
        field(25; "Old STO No."; Code[20])
        {
        }
        field(26; "Uneffected STO"; Boolean)
        {
        }
        field(27; "Auto Process"; Boolean)
        {
        }
        field(28; "Date Reset"; Date)
        {
        }
        field(29; "Reset Again"; Boolean)
        {
        }
        field(30; "Setup Fee Charged"; Boolean)
        {
        }
        field(31; Bolibeng; Boolean)
        {
        }
        field(32; "Sto Code"; Code[20])
        {
        }
        field(33; "Last Run Date"; Date)
        {
        }
        field(34; Loan; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Status = Status::Active then
            Error('Cannot delete approved standing order');
    end;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            NoSetup.Get();
            NoSetup.TestField(NoSetup."Standing Orders Nos.");
            NoSeriesMgt.InitSeries(NoSetup."Standing Orders Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;


        if UsersID.Get(UserId) then
            "Transacting Branch" := UsersID.Branch;
    end;

    var
        NoSetup: Record "Fosa Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Account: Record Vendor;
        UsersID: Record "User Setup";
        BanksList: Record Banks;
        "Bank Name": Text[30];
        Cust: Record Customer;
        Banks: Record "Bank Account";
        GLAccount: Record "G/L Account";
        Text001: label 'The Source Account No %1 and the Destination Account No %2 Should be different';
}

