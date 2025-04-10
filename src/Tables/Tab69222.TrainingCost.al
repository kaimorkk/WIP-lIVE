
table 69222 "Training Cost"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Training ID"; Code[50])
        {
            Editable = false;
        }
        field(2; "Cost Item"; Code[30])
        {
            TableRelation = "HR Models".Code where(Type = filter("Training Item Cost"));
        }
        field(3; Cost; Decimal)
        {
        }
        field(4; "Cost Item Description"; Text[100])
        {
        }
        field(5; "No."; Code[20])
        {
            Caption = 'No.';
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnValidate()
            var
                TempPurchLine: Record "Purchase Line" temporary;
                FindRecordMgt: Codeunit "Find Record Management";
            begin
            end;
        }
        field(6; "Item Description"; Text[100])
        {
            CalcFormula = lookup(Item.Description where("No." = field("Service/Item Code")));
            FieldClass = FlowField;
        }
        field(7; Quantity; Integer)
        {

            trigger OnValidate()
            begin
                "Line Amount" := "Unit Cost (LCY)" * Quantity;
            end;
        }
        field(8; "Procurement Plan"; Code[10])
        {
            // TableRelation = "Procurement Header".No;
        }
        field(9; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item),Service';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)",Service;

            trigger OnValidate()
            var
                TempPurchLine: Record "Purchase Line" temporary;
            begin
            end;
        }
        field(11; Description; Text[100])
        {
            Caption = 'Description';
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnValidate()
            var
                Item: Record Item;
                ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
                FindRecordMgt: Codeunit "Find Record Management";
                ConfirmManagement: Codeunit "Confirm Management";
                ReturnValue: Text[50];
                DescriptionIsNo: Boolean;
            begin
            end;
        }
        field(12; "Unit of Measure"; Text[50])
        {
            Caption = 'Unit of Measure';
            TableRelation = "Unit of Measure";
        }
        field(13; "Unit Cost (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost (LCY)';

            trigger OnValidate()
            var
                Item: Record Item;
                IndirectCostPercent: Decimal;
            begin
            end;
        }
        field(14; "Line Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Amount';
        }
        field(15; Category; Option)
        {
            OptionCaption = ' ,Item,Service,Capex';
            OptionMembers = " ",Item,Service,Capex;
        }
        field(16; "Service/Item Code"; Code[20])
        {
            TableRelation = Item."No." where(Blocked = const(false),
                                              "Item Category Code" = field("Item Category"));

            trigger OnValidate()
            begin


                Item.Reset;
                Item.SetRange("No.", "Service/Item Code");
                if Item.Find('-') then begin
                    Description := Item.Description;
                    //"Unit of Measure Code":= base unit;
                    "Unit of Measure" := Item."Base Unit of Measure";
                end;

                //IF (Category=Category::Item) OR (Category=Category::Service)THEN BEGIN
                "Account Type" := "account type"::Item;
                "No." := "Service/Item Code";

                Item.Reset;
                Item.SetRange("No.", "Service/Item Code");
                if Item.Find('-') then begin
                    Description := Item.Description;
                    "Unit of Measure" := Item."Base Unit of Measure";
                    //"Unit of Measure Code":=Item."Unit of Measure Id";

                end;

                // VALIDATE("No.");
                "Service/Item Code" := "No.";
                //"Item Category":="Posting Group";
                Category := Category::Item;
            end;
        }
        field(17; "Item Category"; Code[20])
        {
            TableRelation = "Item Category".Code;
        }
        field(18; "Vote Item"; Code[20])
        {
            TableRelation = "Procurement Plan1"."Plan Item No" where("Plan Year" = field("Procurement Plan"));
        }
        field(19; "Available Funds"; Decimal)
        {
            Editable = false;
        }
        field(20; Procurable; Boolean)
        {
        }
        field(21; "G/L Account"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(22; "Cost Category"; Option)
        {
            OptionMembers = Procurable,"Other Costs";
        }
        field(23; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Training ID", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Item: Record Item;
        TrainingNeeds: Record "Job Advert Header";
        TrainingPlanLines: Record "Training Plan Lines";
        Text001: label 'The cost cannot be higher than the planned amount for the category selected';
        TrainingCost: Record "Training Cost";
        TrainingRequests: Record "Training Requests";
        Text002: label 'The cost cannot be higher than the approved amount';
}

