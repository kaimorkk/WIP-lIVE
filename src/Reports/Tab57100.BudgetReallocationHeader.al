table 57100 "Budget Reallocation Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; "Budget Code"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Purpose';
        }
        field(4; "Created On"; DateTime)
        {
            Editable = false;
        }
        field(5; "Created By"; Code[200])
        {
            Editable = false;
            TableRelation = "User Setup";
        }
        field(6; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Committee';
            OptionMembers = Open,"Pending Approval",Approved,Committee;
            trigger OnValidate()
            begin
                if "Approval Status" = "Approval Status"::Approved then begin
                    //Update the lines with the consolidation template No
                    Source.Reset();
                    Source.SetLoadFields("Document No", "Consolidation No");
                    Source.SetRange("Document No", "Document No");
                    Source.ModifyAll("Consolidation No", "Consolidation Template");

                    Destination.Reset();
                    Destination.SetRange("Document No.", "Document No");
                    Destination.ModifyAll("Consolidation No", "Consolidation Template");
                end;


            end;
        }
        field(7; Posted; Boolean)
        {
            Editable = false;
            trigger OnValidate()
            begin
                if Posted then begin
                    "Posted By" := UserId;
                    "Posted On" := CurrentDateTime;
                end;
            end;
        }
        field(8; "Entry Type"; Option)
        {
            OptionCaption = 'Re-Allocation,Supplementary';
            OptionMembers = "Re-Allocation",Supplementary;
        }
        field(9; "Net Amount"; Decimal)
        {
            CalcFormula = sum("Budget Modification Lines".Amount where("Document No" = field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Quarter"; Option)
        {
            OptionMembers = " ","Quarter 1","Quarter 2","Quarter 3","Quarter 4";
            trigger OnValidate()
            var
                BudgetDates: array[12, 2] of Date;
            begin
                TestField("Budget Code");
                //get Quarter Dates
                "Quarter Start Date" := 0D;
                "Quarter End Date" := 0D;
                WorkplanMgt.GetBudgetDates("Budget Code", 1, BudgetDates);
                case
                    Quarter of
                    Quarter::"Quarter 1":
                        begin
                            "Quarter Start Date" := BudgetDates[1] [1];
                            "Quarter End Date" := BudgetDates[1] [2];
                        end;
                    Quarter::"Quarter 2":
                        begin
                            "Quarter Start Date" := BudgetDates[2] [1];
                            "Quarter End Date" := BudgetDates[2] [2];
                        end;
                    Quarter::"Quarter 3":
                        begin
                            "Quarter Start Date" := BudgetDates[3] [1];
                            "Quarter End Date" := BudgetDates[3] [2];
                        end;
                    Quarter::"Quarter 4":
                        begin
                            "Quarter Start Date" := BudgetDates[4] [1];
                            "Quarter End Date" := BudgetDates[4] [2];
                        end;
                end;
            end;
        }
        field(11; "Quarter Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Quarter End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Posted By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(14; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "AIE No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "AIE Posted"; Boolean)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Auth. Inc. Expend. Header".Posted where("No." = field("AIE No.")));
        }
        field(18; "Current Quarter"; Option)
        {
            Description = 'Specifies the current Quarter';
            OptionMembers = " ","Quarter 1","Quarter 2","Quarter 3","Quarter 4";
        }
        field(19; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Individual,Consolidated;
        }
        field(21; "Consolidation Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Budget Reallocation Header" where("Document Type" = const(Consolidated), "Approval Status" = const(Open));
        }
        field(22; "Destination Amount"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Budget Reallocation Line".Amount where("Document No." = field("Document No")));
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
            case
                "Entry Type" of
                "Entry Type"::"Re-Allocation":
                    begin
                        if "Document Type" = "Document Type"::Individual then begin
                            GeneralLedgerSetup.Get;
                            GeneralLedgerSetup.TestField("Budget Reallocation Nos.");
                            NoSeriesManagement.InitSeries(GeneralLedgerSetup."Budget Reallocation Nos.", xRec."No Series", 0D, "Document No", "No Series");
                        end else begin
                            GeneralLedgerSetup.Get;
                            GeneralLedgerSetup.TestField("Reallocation Consolidation Nos");
                            NoSeriesManagement.InitSeries(GeneralLedgerSetup."Reallocation Consolidation Nos", xRec."No Series", 0D, "Document No", "No Series");
                        end;
                    end;
                "Entry Type"::"Supplementary":
                    begin
                        GeneralLedgerSetup.Get;
                        GeneralLedgerSetup.TestField("Supplementary Budget Nos");
                        NoSeriesManagement.InitSeries(GeneralLedgerSetup."Supplementary Budget Nos", xRec."No Series", 0D, "Document No", "No Series");
                    end;
            end;

        end;
        "Created By" := UserId;
        "Created On" := CreateDatetime(Today, Time);
    end;

    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        WorkplanMgt: Codeunit "Workplan Management";
        Source: Record "Budget Modification Lines";
        Destination: Record "Budget Reallocation Line";




}

