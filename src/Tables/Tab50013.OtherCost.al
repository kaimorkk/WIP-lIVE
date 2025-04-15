 
table 50013 "Other Costs"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Imprest Memo No."; Code[20])
        {
            TableRelation = "Imprest Memo";
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; Description; Text[150])
        {
            CalcFormula = lookup("Receipts and Payment Types1".Description where(Code = field("Type of Expense")));
            FieldClass = FlowField;
        }
        field(4; "Quantity Required"; Decimal)
        {

            trigger OnValidate()
            begin

                case Type of
                    Type::Item:
                        begin
                            if ItemRec.Get("No.") then;
                            "Unit Cost" := ItemRec."Unit Cost";
                            "Line Amount" := "Quantity Required" * "Unit Cost";
                        end;
                    else
                        "Line Amount" := "Quantity Required" * "Unit Cost";
                end;
            end;
        }
        field(5; "Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                "Line Amount" := "Quantity Required" * "Unit Cost" * "No. of Days";
            end;
        }
        field(6; "Required For"; Text[250])
        {
        }
        field(7; "Line Amount"; Decimal)
        {
            Editable = false;
        }
        field(8; "Work Type"; Code[20])
        {
            TableRelation = "Work Type";
        }
        field(9; "No."; Code[20])
        {
            CalcFormula = lookup("Receipts and Payment Types1"."G/L Account" where(Code = field("Type of Expense"),
                                                                                    "Appear on Imprest?" = filter(true)));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                case Type of
                    Type::"G/L Account":
                        begin
                            if GLAccount.Get("No.") then;
                            Description := GLAccount.Name;
                        end;
                    Type::"Fixed Asset":
                        begin
                            if FA.Get("No.") then;
                            Description := FA.Description;
                        end;
                    Type::Item:
                        begin
                            if ItemRec.Get("No.") then;
                            Description := ItemRec.Description;
                        end;
                    Type::"Charge (Item)":
                        begin
                            if ItemCharge.Get("No.") then;
                            Description := ItemCharge.Description;
                        end;
                end;
                //Ushindi
                CalcFields(Project);
                //Ushindi
            end;
        }
        field(10; Posted; Boolean)
        {
        }
        field(11; Linked; Boolean)
        {
        }
        field(12; Type; Option)
        {
            OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)";
        }
        field(24; Project; Code[20])
        {
            CalcFormula = lookup("Imprest Memo".Project where("No." = field("Imprest Memo No.")));
            FieldClass = FlowField;
        }
        field(25; "Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field(Project));

            trigger OnValidate()
            begin
                CalcFields(Project);
                if TaskRec.Get(Project, "Task No.") then;
                "Job Task Description" := TaskRec.Description;
            end;
        }
        field(26; "Actual Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                "Actual Line Amount" := "Quantity Used" * "Actual Unit Cost";
            end;
        }
        field(27; "Actual Line Amount"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                "Actual Line Amount" := "Quantity Used" * "Actual Unit Cost";
            end;
        }
        field(28; Surrendered; Boolean)
        {
        }
        field(29; "No. of Days"; Decimal)
        {
        }
        field(50020; "Vote Item"; Code[20])
        {
            Editable = false;
            TableRelation = "G/L Account"."No.";
        }
        field(50021; "Vote Amount"; Decimal)
        {
            CalcFormula = lookup("G/L Budget Entry".Amount where("G/L Account No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50022; "Actual to Date"; Decimal)
        {
            Editable = false;
        }
        field(50023; Commitments; Decimal)
        {
            Editable = false;
        }
        field(50024; "Vote Item Desc."; Text[200])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50025; "Available Funds"; Decimal)
        {
            Editable = false;
        }
        field(57000; "Job Task Description"; Text[50])
        {
            Caption = 'Job Task Description';
            Editable = false;
        }
        field(57001; "Quantity Used"; Decimal)
        {

            trigger OnValidate()
            begin
                case Type of
                    Type::Item:
                        begin
                            if ItemRec.Get("No.") then;
                            "Unit Cost" := ItemRec."Unit Cost";
                            "Line Amount" := "Quantity Required" * "Unit Cost";
                            "Actual Line Amount" := "Quantity Used" * "Actual Unit Cost";
                        end;
                    else
                        "Actual Line Amount" := "Quantity Used" * "Actual Unit Cost";
                end;
            end;
        }
        field(57002; "Actual Unit Costs"; Decimal)
        {

            trigger OnValidate()
            begin
                "Actual Line Amount" := "Quantity Used" * "Actual Line Amount";
            end;
        }
        field(57003; "Type of Expense"; Code[50])
        {
            TableRelation = "Receipts and Payment Types1" where("Appear on Imprest?" = filter(true));
        }
        field(57007; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
        }
        field(57008; "Employee No To Surrender"; Code[20])
        {
            TableRelation = "Project Members"."No." where("Imprest Memo No." = field("Imprest Memo No."));

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."No.", "Employee No To Surrender");
                if Employee.FindSet then begin
                    "Employee Name To Surender" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                end;
            end;
        }
        field(57009; "Employee Name To Surender"; Text[250])
        {
        }
        field(69023; Job; Code[50])
        {
            TableRelation = Job where(exchequer = const(true));

            trigger OnValidate()
            begin
                if JobRec.Get(Job) then
                    "Job Name" := JobRec.Description;

            end;
        }
        field(69024; "Job  Task"; Code[50])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job));

            trigger OnValidate()
            begin
                TaskRec.Reset;
                TaskRec.SetRange("Job No.", Job);
                TaskRec.SetRange("Job Task No.", "Job  Task");
                if TaskRec.Find('-') then begin
                    repeat
                        // TaskRec.CalcFields("Schedule (Total Cost)", "Remaining (Total Cost)", "Usage (Total Cost)", Commitments);
                        // "Job Task Name" := TaskRec.Description;
                        // "Job Task Budget" := TaskRec."Schedule (Total Cost)";
                        // "Job Task Remaining Amount" := TaskRec."Schedule (Total Cost)" - (TaskRec."Usage (Total Cost)" - TaskRec.Commitments);
                    until TaskRec.Next = 0;
                end;


                /*
                IF ("Total Entitlement" >"Job Task Remaining Amount") THEN
                     ERROR('Applied imprest Memo of Amount (%1) is more than Available Amount (%2)',"Total Entitlement","Job Task Remaining Amount");
                     */

            end;
        }
        field(69025; "Job Name"; Text[250])
        {
        }
        field(69026; "Job Task Name"; Text[250])
        {
        }
        field(69027; "Job Task Budget"; Decimal)
        {
        }
        field(69028; "Job Task Remaining Amount"; Decimal)
        {
        }
        field(69029; "Payroll No"; Code[20])
        {
            TableRelation = Employee;
            trigger OnValidate()
            var
                Employee: record Employee;
            begin
                if Employee.Get("Payroll No") then
                    "Employee Name" := Employee.FullName();
            end;

        }
        field(69030; "Employee Name"; Text[150])
        {
            Editable = false;
        }
        field(69031; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            CaptionClass = '1,2,1';
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(1, "Global Dimension 1 Code", "Dimension Set ID");
            end;
        }
        field(69032; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            CaptionClass = '1,2,2';
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(2, "Global Dimension 2 Code", "Dimension Set ID");
            end;
        }
        field(69033; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Imprest Memo No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
        FA: Record "Fixed Asset";
        ItemRec: Record Item;
        ItemCharge: Record "Item Charge";
        TaskRec: Record "Job Task";
        Employee: Record Employee;
        JobRec: Record Job;
        DimensionMgt: Codeunit DimensionManagement;
}

