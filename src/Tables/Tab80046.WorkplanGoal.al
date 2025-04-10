
table 80046 "Workplan Goal"
{
    Caption = 'Job Task';
    DrillDownPageID = "Job Task Lines";
    LookupPageID = "Job Task Lines";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Workplan ID"; Code[20])
        {
            Caption = 'Workplan ID';
            Description = 'SPM';
            Editable = true;
            NotBlank = true;
        }
        field(2; "Goal ID"; Code[20])
        {
            Caption = 'Goal ID';
            Description = 'SPM';
            NotBlank = true;
            TableRelation = Workplan."No.";

            trigger OnValidate()
            var
                Job: Record Job;
                Cust: Record Customer;
            begin
            end;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            Description = 'SPM';
        }
        field(4; "Job Task Type"; Option)
        {
            Caption = 'Job Task Type';
            OptionCaption = 'Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(7; "Job Posting Group"; Code[20])
        {
            Caption = 'Job Posting Group';
            TableRelation = "Job Posting Group";
        }
        field(19; "Posting Date Filter"; Date)
        {
            Caption = 'Posting Date Filter';
            FieldClass = FlowFilter;
        }
        field(20; "Planning Date Filter"; Date)
        {
            Caption = 'Planning Date Filter';
            FieldClass = FlowFilter;
        }
        field(21; Totaling; Text[250])
        {
            Caption = 'Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(22; "New Page"; Boolean)
        {
            Caption = 'New Page';
        }
        field(23; "No. of Blank Lines"; Integer)
        {
            BlankZero = true;
            Caption = 'No. of Blank Lines';
            MinValue = 0;
        }
        field(24; Indentation; Integer)
        {
            Caption = 'Indentation';
            MinValue = 0;
        }
        field(25; "Strategic Objective ID"; Code[50])
        {
            Description = 'SPM';
            TableRelation = "Strategic Objective"."Objective ID";
        }
        field(26; "Strategic Objective"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Workplan ID", "Goal ID")
        {
            Clustered = true;
        }
        key(Key2; "Goal ID")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Goal ID", Description, "Job Task Type")
        {
        }
    }

    trigger OnDelete()
    var
        JobPlanningLine: Record "Job Planning Line";
        JobWIPTotal: Record "Job WIP Total";
        JobTaskDim: Record "Job Task Dimension";
    begin
    end;

    trigger OnInsert()
    var
        Job: Record Job;
        Cust: Record Customer;
    begin
    end;

    var
        CannotDeleteAssociatedEntriesErr: label 'You cannot delete %1 because one or more entries are associated.', Comment = '%1=The job task table name.';
        CannotChangeAssociatedEntriesErr: label 'You cannot change %1 because one or more entries are associated with this %2.', Comment = '%1 = The field name you are trying to change; %2 = The job task table name.';
        Job: Record Job;
        DimMgt: Codeunit DimensionManagement;
}

