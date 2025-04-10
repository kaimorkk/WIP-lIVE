table 96050 "Tender Alert Portal Users"
{
    Caption = 'Tender Alert Portal Users';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "User ID"; Code[20])
        {
            Caption = 'User ID';
            Editable = false;
        }
        field(2; "User Name"; Text[100])
        {
            Caption = 'User Name';
        }
        field(3; Blocked; Boolean)
        {
            Editable = false;
        }
        field(4; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");

                Users.Reset();
                Users.SetRange("E-Mail", "E-Mail");
                if Users.FindFirst() then
                    Error(EmailExistsErr, "E-Mail");
            end;
        }
        field(5; "ID Number"; Code[80])
        {
            Caption = 'ID Number';

            trigger OnValidate()
            begin
                Users.Reset();
                Users.SetRange("ID Number", "ID Number");
                if Users.FindFirst() then
                    Error(IDExistsErr, "ID Number");
            end;
        }
        field(6; Password; Text[2048])
        {
            Caption = 'Password';
            ExtendedDatatype = Masked;
        }
        field(7; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;

            trigger OnValidate()
            begin
                Users.Reset();
                Users.SetRange("Phone No.", "Phone No.");
                if Users.FindFirst() then
                    Error(PhoneExistsErr, "Phone No.");
            end;
        }
        field(8; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(10; "Last DateTime Modified"; DateTime)
        {
            Caption = 'Last DateTime Modified';
            Editable = false;
        }
        field(11; "User Security ID"; Guid)
        {
            Editable = false;
        }
        field(12; "Email Verified"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Email Verified At"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "Phone No. Verified"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Phone No. Verified At"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Total Cost of SMS"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Received Alerts".Cost where("User ID" = field("User ID"), "Alert Type" = filter(SMS),Status = filter(Sent)));
        }
        field(18; "Total Cost of E-Mails"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Received Alerts".Cost where("User ID" = field("User ID"), "Alert Type" = filter("E-Mail"),Status = filter(Sent)));
        }
        field(19; "Total Cost"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Received Alerts".Cost where("User ID" = field("User ID"), "Alert Type" = filter(SMS|"E-Mail"),Status = filter(Sent)));
        }
        field(20; "No. of SMS"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Received Alerts" where("User ID" = field("User ID"), "Alert Type" = filter(SMS),Status = filter(Sent)));
        }
        field(21; "No. of E-Mails"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Received Alerts" where("User ID" = field("User ID"), "Alert Type" = filter("E-Mail"),Status = filter(Sent)));
        }
        field(22; "No. of Notifications"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Received Alerts" where("User ID" = field("User ID"), "Alert Type" = filter(SMS|"E-Mail"),Status = filter(Sent)));
        }
        field(23; "Account Balance"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Alert Transaction Entries".Amount where("User ID" = field("User ID")));
        }
    }
    keys
    {
        key(PK; "User ID")
        {
            Clustered = true;
        }
        key(UserInfo; "E-Mail", /* "ID Number", */ "User Security ID", "Phone No.")
        {
            Unique = true;
        }
    }

    trigger OnInsert()
    begin
        TAlertSetup.Get();
        TAlertSetup.TestField("User Nos.");

        if NoSeries.AreRelated(TAlertSetup."User Nos.", xRec."No. series") then
            "No. series" := xRec."No. series"
        else
            "No. series" := TAlertSetup."User Nos.";
        "User ID" := NoSeries.GetNextNo("No. series");
        Users.ReadIsolation(IsolationLevel::ReadUncommitted);
        Users.SetLoadFields("User ID");
        while Users.Get("User ID") do
            "User ID" := NoSeries.GetNextNo("No. series");

        TestField("User Name");
        // TestField("ID Number");
        // Validate("ID Number");
        TestField("E-Mail");
        Validate("E-Mail");
        TestField("Phone No.");
        Validate("Phone No.");
        TestField(Password);

        "Document Date" := Today;

    end;

    trigger OnModify()
    begin
        SetLastDateTimeModified();
    end;

    trigger OnRename()
    begin
        SetLastDateTimeModified();
    end;
    
    var
        Users: Record "Tender Alert Portal Users";
        TAlertSetup: Record "Tender Alert Setups";
        NoSeries: Codeunit "No. Series";
        IDExistsErr: Label 'The ID Number: %1 already exists.';
        EmailExistsErr: Label 'The Email: %1 already exists.';
        PhoneExistsErr: Label 'The Phone No: %1 already exists.';

    local procedure SetLastDateTimeModified()
    begin
        Rec."Last Date Modified" := Today;
        Rec."Last DateTime Modified" := CurrentDateTime;
    end;
}
