
table 80099 "Objective Template Line"
{
    Caption = 'Job Task';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Objective Template ID"; Code[20])
        {
            Caption = 'Job No.';
            Editable = true;
            NotBlank = true;
            TableRelation = Job;
        }
        field(2; "Objective ID"; Code[20])
        {
            Caption = 'Job Task No.';
            NotBlank = true;

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
        }
        field(4; "Objective Line Type"; Option)
        {
            Caption = 'Job Task Type';
            OptionCaption = 'Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(5; Totaling; Text[250])
        {
            Caption = 'Totaling';
            TableRelation = "Objective Template Line"."Objective ID" where("Objective Template ID" = field("Objective Template ID"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if Totaling <> '' then
                    if not ("Objective Line Type" in ["objective line type"::Total, "objective line type"::"End-Total"]) then
                        FieldError("Objective Line Type");
            end;
        }
        field(6; Indentation; Integer)
        {
            Caption = 'Indentation';
            MinValue = 0;
        }
        field(7; "Outcome Perfomance Indicator"; Decimal)
        {
        }
        field(8; "Unit of Measure"; Code[30])
        {
            TableRelation = "Unit of Measure".Code;
        }
        field(9; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = ' ,Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = " ","Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(10; "Weight (%)"; Decimal)
        {
        }
        field(11; "Annual Target"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Objective Template ID", "Objective ID")
        {
            Clustered = true;
        }
        key(Key2; "Objective ID")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Objective ID", Description, "Objective Line Type")
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

