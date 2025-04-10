
table 95138 "Risk Incident Log Action"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Incident ID"; Code[20])
        {
        }
        field(2; "Action Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Action Type"; Option)
        {
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(4; Description; Text[300])
        {
        }
        field(5; "Action Status"; Option)
        {
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;

            trigger OnValidate()
            begin
                if "Action Status" = "action status"::Planned then begin
                    "% Complete" := 0;
                end;
                if "Action Status" = "action status"::Completed then begin
                    "% Complete" := 100;
                end;
            end;
        }
        field(6; "% Complete"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(7; "Actual Date Done"; Date)
        {
        }
        field(8; "Responsible Officer No."; Code[20])
        {
            TableRelation = Resource;

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Responsible Officer No.");
                if Resource.FindSet then begin
                    "Responsible Officer No." := Resource."No.";
                    "Responsible Officer Name" := Resource.Name;
                    "Responsible Officer Email" := Resource.Email;
                end;

            end;
        }
        field(9; "Task Priority"; Option)
        {
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(10; "Planned Start Date"; Date)
        {
        }
        field(11; "Planned Due Date"; Date)
        {
        }
        field(12; Comments; Text[300])
        {
        }
        field(13; "Responsible Officer Name"; Text[30])
        {
        }
        field(14; "Responsible Officer Email"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Incident ID", "Action Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
}

