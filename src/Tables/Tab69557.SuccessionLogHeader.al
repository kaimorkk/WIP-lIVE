
table 69557 "Succession Log Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
        }
        field(2; "Succession Program"; Code[30])
        {
            TableRelation = "Succession Plan Header".Code;
        }
        field(3; Mentee; Code[10])
        {
            TableRelation = "Succession Plan Lines"."Employee No" where("Document No" = field("Succession Program"));

            trigger OnValidate()
            begin
                SuccessionPlanLines.Reset;
                SuccessionPlanLines.SetRange("Document No", "Succession Program");
                SuccessionPlanLines.SetRange("Employee No", Mentee);
                if SuccessionPlanLines.FindSet then begin
                    "Mentee Name" := SuccessionPlanLines."Employee Name";
                    Description := SuccessionPlanLines."Employee Name" + ' Succession Log';
                    Mentor := SuccessionPlanLines.Mentor;
                    "Position ID" := SuccessionPlanLines."Projected Position ID";
                end;
            end;
        }
        field(4; "Mentee Name"; Text[250])
        {
        }
        field(5; Description; Text[250])
        {
        }
        field(6; Mentor; Code[30])
        {
            TableRelation = Resource."No." where(Type = const(Person),
                                                  Blocked = const(false));
        }
        field(7; "Created By"; Code[50])
        {
        }
        field(8; "Document Date"; Date)
        {
        }
        field(9; "No. Series"; Code[30])
        {
        }
        field(10; "Position ID"; Code[30])
        {
        }
        field(11; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No" = '' then begin
            HumanResourcesSetup.Get;
            HumanResourcesSetup.TestField("Succession Log Nos");
            NoSeriesManagement.InitSeries(HumanResourcesSetup."Succession Log Nos", xRec."No. Series", 0D, "Document No", "No. Series");
        end;
        "Created By" := UserId;
        "Document Date" := Today;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        SuccessionPlanLines: Record "Succession Plan Lines";
}

