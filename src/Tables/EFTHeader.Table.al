Table 52193512 "EFT Header"
{
    // //DrillDownPageID = UnknownPage51508018;
    // //LookupPageID = UnknownPage51508018;

    fields
    {
        field(1; No; Code[20])
        {

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    // NoSetup.Get();
                    //NoSeriesMgt.TestManual(NoSetup."EFT Header Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(3; Transferred; Boolean)
        {
            Editable = true;
        }
        field(4; "Date Transferred"; Date)
        {
            Editable = false;
        }
        field(5; "Time Transferred"; Time)
        {
            Editable = false;
        }
        field(6; "Transferred By"; Text[50])
        {
            Editable = false;
        }
        field(7; "Date Entered"; Date)
        {
        }
        field(8; "Time Entered"; Time)
        {
        }
        field(9; "Entered By"; Text[50])
        {
        }
        field(10; Remarks; Text[100])
        {
        }
        field(11; "Payee Bank Name"; Text[30])
        {
        }
        field(12; "Bank  No"; Code[20])
        {
            TableRelation = "Bank Account" where(Type = filter(Bank));

            trigger OnValidate()
            begin

                Banks.Reset;
                if Banks.Get("Bank  No") then begin
                    "Payee Bank Name" := Banks.Name;
                end;
            end;
        }
        field(13; "Salary Processing No."; Code[20])
        {
        }
        field(14; "Salary Options"; Option)
        {
            OptionMembers = "Add To Existing","Replace Lines";
        }
        field(15; Total; Decimal)
        {
            CalcFormula = sum("EFT Details".Amount where(No = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Total Count"; Integer)
        {
            CalcFormula = count("EFT Details" where(No = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; Cashier; Code[50])
        {
            Editable = false;
        }
        field(18; "Transacting Branch"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        /*IF Transferred = TRUE THEN
        ERROR('You cannot delete an already posted record.'); */

    end;

    trigger OnInsert()
    begin
        if No = '' then begin
            // NoSetup.Get();
            // NoSetup.TestField(NoSetup."EFT Header Nos.");
            // NoSeriesMgt.InitSeries(NoSetup."EFT Header Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;

        Cashier := UserId;
        "Date Entered" := Today;
        "Time Entered" := Time;
        "Entered By" := UserId;

        if UsersID.Get(UserId) then
            "Transacting Branch" := UsersID.Branch;
    end;

    trigger OnModify()
    begin
        if Transferred = true then
            Error('You cannot modify an already posted record.');
    end;

    var
        NoSetup: Record "Fosa Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Accounts: Record Vendor;
        Members: Record Vendor;
        AccountHolders: Record Vendor;
        Banks: Record "Bank Account";
        BanksList: Record Banks;
        UsersID: Record "User Setup";
}

