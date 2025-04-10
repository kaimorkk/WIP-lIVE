table 96060 "Tender Alert Activity Cue"
{
    Caption = 'Tender Alert Activity Cue';
    DataClassification = ToBeClassified;
    ReplicateData = false;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "SMS Sent"; Integer)
        {
            Caption = 'SMS Sent';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Received Alerts" where("Alert Type" = filter(SMS),Status = filter(Sent)));
        }
        field(3; "E-Mail Sent"; Integer)
        {
            Caption = 'E-Mail Sent';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Received Alerts" where("Alert Type" = filter("E-Mail"),Status = filter(Sent)));
        }
        field(4; "Notifications Sent"; Integer)
        {
            Caption = 'Notifications Sent';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Received Alerts" where("Alert Type" = filter(SMS|"E-Mail"),Status = filter(Sent)));
        }
        field(5; "SMS Cost"; Decimal)
        {
            Caption = 'SMS Cost';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Received Alerts".Cost where("Alert Type" = filter(SMS),Status = filter(Sent)));
        }
        field(6; "E-Mail Cost"; Decimal)
        {
            Caption = 'E-Mail Cost';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Received Alerts".Cost where("Alert Type" = filter("E-Mail"),Status = filter(Sent)));
        }
        field(7; "Notification Cost"; Decimal)
        {
            Caption = 'Notification Cost';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Received Alerts".Cost where("Alert Type" = filter(SMS|"E-Mail"),Status = filter(Sent)));
        }
        field(8; "Total Users"; Integer)
        {
            Caption = 'Total Users';
        }
        field(9; "Active Subscriptions"; Integer)
        {
            Caption = 'Active Subscriptions';
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
