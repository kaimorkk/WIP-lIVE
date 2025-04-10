
table 95202 "Audit Project Checklist"
{
    DrillDownPageID = "Audit Project Checklists";
    LookupPageID = "Audit Project Checklists";

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Checklist ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Audit Procedure ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Procedure"."Audit Procedure ID" where("Engagement ID" = field("Engagement ID"));

            trigger OnValidate()
            begin
                AuditProjectProcedure.Reset;
                //AuditProjectProcedure.SETRANGE(AuditProjectProcedure."Engagement ID","Engagement ID");
                AuditProjectProcedure.SetRange(AuditProjectProcedure."Audit Procedure ID", "Audit Procedure ID");
                if AuditProjectProcedure.FindSet then begin
                    "Audit Objective ID" := AuditProjectProcedure."Audit Objective ID";
                    //Description:=AuditProjectProcedure.Description;
                    "Procedure Description" := AuditProjectProcedure.Description;
                    // MODIFY;
                end;
            end;
        }
        field(4; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Fieldwork Review Status"; Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Planned;
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;

            trigger OnValidate()
            begin
                if (("Fieldwork Review Status" = "fieldwork review status"::Ongoing) or
                  ("Fieldwork Review Status" = "fieldwork review status"::Planned)) then
                    "Completion %" := 0
                else
                    if "Fieldwork Review Status" = "fieldwork review status"::Completed then
                        "Completion %" := 100;
            end;
        }
        field(6; "Completion %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Completion %" = 100 then
                    "Fieldwork Review Status" := "fieldwork review status"::Completed
                else
                    "Fieldwork Review Status" := "fieldwork review status"::Ongoing;
            end;
        }
        field(7; "No. Of Audit Test Methods"; Integer)
        {
            CalcFormula = count("Audit Checklist Test Method" where("Engagement ID" = field("Engagement ID"),
                                                                     "Checklist ID" = field("Checklist ID")));
            Description = 'No. of Audit Testing Methods/Guidelines';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Audit Objective ID"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Procedure Description"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Engagement ID", "Checklist ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditProjectProcedure: Record "Audit Project Procedure";
}

