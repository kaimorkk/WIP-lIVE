table 50112 "Expense Req. Allocation"
{
    Caption = 'Expense Req. Allocation';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            trigger OnValidate()
            var
                myInt: Integer;
                ExpReq: Record "Expense Requisition";
            begin
                if ExpReq.Get("Document No.") then begin
                    ExpReq.Testfield("Global Dimension 1 Code");
                    ExpReq.Testfield("Global Dimension 2 Code");
                    ExpReq.TestField("Activity Code");
                    Workplan := ExpReq.Workplan;
                    rec."Procurement Plan Id" := ExpReq."Procurement Plan ID";
                    "Budget Code" := ExpReq."Budget Code";
                    "Activity Id" := ExpReq."Activity Code";
                    "PP Plan Category" := ExpReq."PP Plan Category";
                    "Global Dimension 1 Code" := ExpReq."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := ExpReq."Global Dimension 2 Code";
                end;

            end;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(3; "Type"; Option)
        {
            OptionMembers = Imprest,"Direct Expense",PRN,"Staff Claim";
        }
        field(4; "Payee"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Employee No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
            trigger OnValidate()
            var
                Employee: Record Employee;
                Resources: Record Resource;
            begin
                if Employee.Get("Employee No.") then begin
                    "Employee Name" := Employee.FullName();
                    "Job Group" := Employee."Salary Scale";
                    Validate("Job Group");
                    Payee := "Employee Name";
                end else begin
                    if Resources.Get("Resource No.") then begin
                        // Resources.CalcFields("Job Group");
                        Payee := Resources.Name;
                        // "Job Group" := Resources."Job Group";
                        Validate("Job Group");
                        "Employee Name" := Resources.Name;
                    end;
                end;
            end;
        }
        field(6; "Job Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                ResourceCost: Record "Resource Cost";
            begin
                ResourceCost.Reset();
                ResourceCost.SetRange(Code, "Job Group");
                ResourceCost.SetRange("Work Type Code", Destination);
                if ResourceCost.FindFirst() then begin
                    Rate := ResourceCost."Direct Unit Cost";
                end;
            end;
        }
        field(7; "G/L Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
            Editable = false;
        }
        field(8; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate(Total);
            end;
        }
        field(9; "Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate(Total);
            end;
        }
        field(10; "Total"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            var
                ExpenseReq: Record "Expense Requisition Line";
                ExpenseRE: Record "Expense Req. Allocation";
                Tamount: Decimal;
            begin
                Tamount := 0;
                Total := Quantity * Rate;
                ExpenseRE.Reset();
                ExpenseRE.SetRange("Document No.", Rec."Document No.");
                if ExpenseRE.FindFirst() then begin
                    ExpenseRE.CalcSums(Total);
                    Tamount := ExpenseRE.Total;
                end;
                ExpenseReq.Reset();
                ExpenseReq.SetRange("Document No.", Rec."Document No.");
                if ExpenseReq.FindFirst() then begin
                    if Tamount > ExpenseReq."Total Amount" then
                        Error('Total cannot be greater than the total amount on the Expense Req'' allocation line');
                end;
            end;
        }
        field(11; "Supplier"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(12; "Expense Description"; Text[1048])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Workplan"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Status"; Option)
        {
            OptionMembers = New,"Pending Commitment","Committed","Fully Utilized","Recalled";
            Editable = false;
            trigger OnValidate()
            begin
                case
                    Status of
                    Status::Recalled:
                        begin
                            "Recalled By" := UserId;
                            "Recalled On" := CurrentDateTime;
                        end;
                end;
            end;
        }
        field(15; "Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(16; "Activity Id"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Recalled By"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User Id";
            Editable = false;
        }
        field(18; "Recalled On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(20; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(21; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(22; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(23; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
        }
        field(24; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
        }
        field(25; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
        }
        field(26; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));
        }
        field(27; "Source Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Employee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; "Resource No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource where(Type = filter(Person));
            trigger OnValidate()
            var
                Employee: Record Employee;
                Resource: Record Resource;
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Resource No.");
                if Employee.FindFirst() then begin
                    "Employee No." := Employee."No.";
                    validate("Employee No.");
                end;
            end;
        }
        field(30; "Destination"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Work Type" where(Category = filter("Project Team" | Machines));
            trigger OnValidate()
            begin
                Validate("Job Group");
            end;
        }
        field(31; "Employee Type"; Option)
        {
            OptionMembers = Employee,"Non Employee";
            InitValue = Employee;
        }
        field(32; "Imprest No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Vote Item"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Receipts and Payment Types1".Code where(Type = const(Imprest));
        }
        field(34; "Proc Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(35; "Procurement Plan Id"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code where("Plan Type" = const(Consolidated));
        }
        field(36; "PP Plan Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan Lines"."Planning Category" where("Procurement Plan ID" = field("Procurement Plan ID"));
        }
        field(37; "ProcPlan Entry No."; Integer)
        {
            Caption = 'Procurement Plan Entry No.';
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan Entry"."Entry No." where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                        // "Planning Category" = field("PP Plan Category"),
                                                                        "Budget Account" = field("G/L Account"),
                                                                        "Global Dimension 1 Code" = field("Global Dimension 1 Code"),
                                                                        "Global Dimension 2 Code" = field("Global Dimension 2 Code"),
                                                                        // "Shortcut Dimension 3 Code" = field("Shortcut Dimension 3 Code"),
                                                                        // "Shortcut Dimension 4 Code" = field("Shortcut Dimension 4 Code"),
                                                                        // "Shortcut Dimension 5 Code" = field("Shortcut Dimension 5 Code"),
                                                                        // "Shortcut Dimension 6 Code" = field("Shortcut Dimension 6 Code"),
                                                                        // "Shortcut Dimension 7 Code" = field("Shortcut Dimension 7 Code"),
                                                                        // "Shortcut Dimension 8 Code" = field("Shortcut Dimension 8 Code"),
                                                                        Blocked = const(false));
            trigger OnValidate()
            var
                PPEntry: Record "Procurement Plan Entry";
            begin
                PPEntry.Reset();
                PPEntry.SetRange("Procurement Plan ID", "Procurement Plan Id");
                //PPEntry.SetRange("Planning Category", "PP Plan Category");
                PPEntry.SetRange("Entry No.", rec."ProcPlan Entry No.");
                if PPEntry.FindFirst() then begin
                    case
                        PPEntry."Plan Item Type" of
                        PPEntry."Plan Item Type"::"Fixed Asset":
                            "Line Type" := "Line Type"::"Fixed Asset";
                        PPEntry."Plan Item Type"::"Item":
                            "Line Type" := "Line Type"::Item;
                    end;
                    "No." := PPEntry."Plan Item No";
                    Validate("No.");
                end;
            end;
        }
        field(38; "Line Type"; Enum "Purchase Line Type")
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(39; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Line Type" = const("Fixed Asset")) "Fixed Asset" where(Blocked = const(false))
            else
            if ("Line Type" = const(Item)) Item."No." where(Blocked = const(false), "Purchasing Blocked" = const(false));

            trigger OnValidate()
            var
                FixedAsset: Record "Fixed Asset";
                Item: Record Item;
            begin
                case
                    "Line Type" of
                    "Line Type"::"Fixed Asset":
                        begin
                            if FixedAsset.Get("No.") then begin
                                Name := FixedAsset.Description;
                            end;
                        end;
                    "Line Type"::Item:
                        begin
                            if Item.Get("No.") then begin
                                Name := Item.Description;
                            end;
                        end;
                end;
            end;
        }
        field(40; "Name"; Text[250])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(41; "Unit of Measure"; Code[20])
        {
            Editable = false;
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(42; "Requisition Product Group"; Option)
        {
            DataClassification = CustomerContent;
            Description = 'New field used to categorize the Items further into Goods, Works, Services and Assets. NB: In most organizations, the Works, Services and Assets shall be setup under TYPE:SERVICE';
            OptionCaption = 'Goods,Services,Works,Assets';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(43; "Supplier Invoice No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Supplier Invoice Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Contract No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Buy-from Vendor No." = field(Supplier), "Document Type" = const("Blanket Order"));
        }
        field(46; "Lpo No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Buy-from Vendor No." = field(Supplier), "Document Type" = const(Order));
            trigger OnValidate()
            var
                PurchHeader: Record "Purchase Header";
            begin
                if PurchHeader.get(PurchHeader."Document Type"::Order, "Lpo No") then begin
                    PurchHeader.Receive := true;
                    PurchHeader.Invoice := true;
                    PurchHeader.Modify();
                end;
            end;
        }
        field(47; "Item To Line pay"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Line"."Line No." where("Document Type" = const(Order), "Document No." = field("Lpo No"));
            trigger OnValidate()
            var
                PurchaseLines: Record "Purchase Line";
            begin
                if PurchaseLines.get(PurchaseLines."Document Type"::Order, "Lpo No", Rec."Line No.") then begin
                    "Item No" := "No.";
                    "Expense Description" := PurchaseLines.Description;
                end;
            end;
        }
        field(48; "Item No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key1; "Document No.", Type)
        {
        }
        Key(Key2; "Document No.", "Source Line No.")
        {
            SumIndexFields = Total;
        }
    }
    trigger OnInsert()
    var
        ExpReq: Record "Expense Requisition";
        EXPReqLine: Record "Expense Requisition Line";
    begin
        if ExpReq.Get("Document No.") then begin
            ExpReq.Testfield("Global Dimension 1 Code");
            ExpReq.Testfield("Global Dimension 2 Code");
            ExpReq.TestField("Activity Code");
            Workplan := ExpReq.Workplan;
            rec."Procurement Plan Id" := ExpReq."Procurement Plan ID";
            "Budget Code" := ExpReq."Budget Code";
            "Activity Id" := ExpReq."Activity Code";
            "PP Plan Category" := ExpReq."PP Plan Category";
            "Global Dimension 1 Code" := ExpReq."Global Dimension 1 Code";
            "Global Dimension 2 Code" := ExpReq."Global Dimension 2 Code";
        end;
        EXPReqLine.Reset();
        EXPReqLine.setrange("Document No.", Rec."Document No.");
        EXPReqLine.SetRange("Line No.", Rec."Source Line No.");
        if EXPReqLine.FindFirst() then begin
            "Shortcut Dimension 3 Code" := EXPReqLine."Shortcut Dimension 3 Code";
            "Shortcut Dimension 4 Code" := EXPReqLine."Shortcut Dimension 4 Code";
            "Shortcut Dimension 5 Code" := EXPReqLine."Shortcut Dimension 5 Code";
            "Shortcut Dimension 6 Code" := EXPReqLine."Shortcut Dimension 6 Code";
            "Shortcut Dimension 7 Code" := EXPReqLine."Shortcut Dimension 7 Code";
            "Shortcut Dimension 8 Code" := EXPReqLine."Shortcut Dimension 8 Code";
        end;
    end;
}
