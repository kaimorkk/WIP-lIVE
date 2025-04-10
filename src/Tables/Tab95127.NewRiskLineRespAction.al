
table 95127 "New Risk Line Resp. Action"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2; "Document No"; Code[20])
        {
        }
        field(3; "Risk ID"; Integer)
        {
        }
        field(4; "Action ID"; Integer)
        {
            AutoIncrement = true;

            trigger OnValidate()
            begin
                "Risk ID" := Rec.Count + 50000;
            end;
        }
        field(5; "Activity Description"; Text[250])
        {
        }
        field(6; "Responsible Officer No."; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange(Resource."No.", "Responsible Officer No.");
                if Resource.FindSet then
                    "Responsible Officer Name" := Resource.Name;
            end;
        }
        field(7; "Action Status"; Option)
        {
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(8; "Percentage Complete"; Decimal)
        {
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
        field(12; "Actual Date Done"; Date)
        {
        }
        field(13; "Action Type"; Option)
        {
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(14; "Risk Register Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(15; "Risk Management Plan ID"; Code[20])
        {
            TableRelation = "Risk Management Plan"."Document No" where("Document Type" = field("Risk Register Type"));
        }
        field(16; "Risk Action Taken"; Text[2000])
        {
        }
        field(17; "Responsible Officer Name"; Text[100])
        {
            Editable = false;
        }
        field(18; "Risk Response Action Taken"; Text[2048])
        {
        }
        field(19; Timeline; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk Register Type", "Risk Management Plan ID", "Risk ID", "Action ID")
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

