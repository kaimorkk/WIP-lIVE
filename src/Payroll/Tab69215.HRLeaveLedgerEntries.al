
table 69215 "HR Leave Ledger Entries"
{
    Caption = 'Leave Ledger Entry';
    DrillDownPageID = "Hr Leave Ledger Entries";
    LookupPageID = "Hr Leave Ledger Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Leave Period"; Code[20])
        {
            Caption = 'Leave Period';
            TableRelation = "HR Leave Periods";
        }
        field(3; Closed; Boolean)
        {
            Caption = 'Closed';
        }
        field(4; "Staff No."; Code[20])
        {
            Caption = 'Staff No.';
        }
        field(5; "Staff Name"; Text[200])
        {
            Caption = 'Staff Name';
        }
        field(6; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(7; "Leave Entry Type"; Option)
        {
            Caption = 'Leave Entry Type';
            OptionCaption = 'Positive,Negative,Reimbursement';
            OptionMembers = Positive,Negative,Reimbursement;
        }
        field(8; "Leave Approval Date"; Date)
        {
            Caption = 'Leave Approval Date';
        }
        field(9; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(10; "External Document No."; Code[20])
        {
            Caption = 'External Document No.';
        }
        field(11; "Job ID"; Code[250])
        {
            //  TableRelation = Table0.Field4;
        }
        field(12; "Job Group"; Code[250])
        {
            //   TableRelation = "ManPower Planning Lines".Field23;
        }
        field(13; "Contract Type"; Code[20])
        {
        }
        field(14; "No. of days"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'No. of days';
            ObsoleteState = Removed;
        }
        field(15; "Leave Start Date"; Date)
        {
        }
        field(16; "Leave Posting Description"; Text[200])
        {
            Caption = 'Leave Posting Description';
        }
        field(17; "Leave End Date"; Date)
        {
        }
        field(18; "Leave Return Date"; Date)
        {
        }
        field(20; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(21; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(22; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(23; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User;
            //This property is currently not supported
            //TestTableRelation = false;

            // trigger OnLookup()
            // var
            //     LoginMgt: Codeunit "User Management";
            // begin
            //     LoginMgt.LookupUserID("User ID");
            // end;
        }
        field(24; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(25; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
        field(26; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(27; "Index Entry"; Boolean)
        {
            Caption = 'Index Entry';
        }
        field(28; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(29; "Leave Recalled No."; Code[20])
        {
            Caption = 'Leave Application No.';
            // TableRelation = "HR Leave Application"."Application Code" where ("Employee No"=field("Staff No."),
            //                                                                  Status=const("7"));
        }
        field(30; "Leave Type"; Code[30])
        {
            TableRelation = "HR Leave Types".Code;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
        field(481; "Leave Posting Type"; Option)
        {
            FieldClass = Normal;
            OptionCaption = 'Annual,Compassionate,Marternity,Parternity,Sick Leave,Study Leave,Sports Leave,Unpaid Leave,Terminal Leave,Off';
            OptionMembers = Annual,Compassionate,Marternity,Parternity,"Sick Leave","Study Leave","Sports Leave","Unpaid Leave","Terminal Leave",Off;
        }
        field(482; "Posted"; Boolean)
        {

        }
        field(483; "No. of days1"; Integer)
        {
            AutoFormatType = 1;
            Caption = 'No. of days';
        }

    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Leave Period", "Posting Date")
        {
            SumIndexFields = "No. of days1";
        }
        key(Key3; "Leave Period", Closed, "Posting Date")
        {
            SumIndexFields = "No. of days1";
        }
        key(Key4; "Staff No.", "Leave Period", Closed, "Posting Date")
        {
            SumIndexFields = "No. of days1";
        }
        key(Key5; "Staff No.", Closed, "Posting Date")
        {
        }
        key(Key6; "Posting Date", "Leave Entry Type", "Staff No.")
        {
            SumIndexFields = "No. of days1";
        }
        key(Key7; "Staff No.")
        {
            SumIndexFields = "No. of days1";
        }
        key(Key8; "Leave Entry Type", "Staff No.", "Leave Type", Closed)
        {
            SumIndexFields = "No. of days1";
        }
        key(Key9; "Leave Entry Type", "Staff No.", Closed)
        {
            Enabled = false;
            SumIndexFields = "No. of days1";
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Leave Period", "Staff No.", "Staff Name", "Posting Date")
        {
        }
    }

    var
        DimMgt: Codeunit DimensionManagement;


    procedure ShowDimensions()
    begin
        DimMgt.ShowDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', TableCaption, "Entry No."));
    end;

    procedure NotifyEmployee(Emp: record Employee; Days: Decimal; LeaveType: Code[20]; AdjustmentType: Text[20])
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Recipient: Text[100];
        Body: Text;
        Subject: Text[100];
    begin
        //     Clear(Recipient);
        //     Recipient := Emp."Company E-Mail";
        //     Subject := 'LEAVE ADJUSTMENT';
        //     Body := 'Dear ' + Emp."First Name" + ',<br>'
        //     + 'Your ' + LeaveType + ' leave has been adjusted ' + AdjustmentType + ' by ' + Format(Days) + ' days <br>';
        //     EmailMessage.Create(Recipient, Subject, Body, true);
        //    if Email.Send(EmailMessage) then;
    end;
}

