TableExtension 52193441 tableextension52193441 extends "Purchase Line"
{
    fields
    {

        field(50000; "Purchase Requisition No."; Code[20])
        {
            Editable = false;
            Enabled = false;
            DataClassification = CustomerContent;
        }
        field(50001; "Purchase Requisition Line No."; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50002; Status; Option)
        {
            CalcFormula = lookup("Purchase Header".Status where("Document Type" = field("Document Type"),
                                                                 "No." = field("Document No.")));
            Editable = true;
            FieldClass = FlowField;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Cancelled';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled;
        }
        field(50003; Select; Boolean)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Modify(false);
            end;
        }
        field(50004; "Quantity To  Issue"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin


                Modify(false);
                if "Quantity To  Issue" = 0 then
                    Error('YOU CANNOT ISSUE ZERO QUANTITIES.PLEASE CHECK!!');


            end;
        }
        field(50005; Category; Option)
        {
            OptionCaption = ' ,Item,Service,Capex';
            OptionMembers = " ",Item,Service,Capex;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin

                //Ushindi
                TestStatusOpen;
                if Category = Category::Item then begin
                    Type := Type::Item
                end;
            end;
        }
        field(50006; "Service/Item Code"; Code[20])
        {
            TableRelation = if ("Document Type" = const("Store Requisition")) Item."No." where(Blocked = const(false)/* , "Location Filter" = field("Location Code") */) 
            else Item."No." where(Blocked = const(false), "Location Filter" = field("Location Code"), "Procurement Category" = field("Item Category"));
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Phead: Record "Purchase Header";
            begin

                Type := Type::Item;
                "No." := "Service/Item Code";
                //Validate("No.");
                Category := Category::Item;


                GetItem.Reset;
                GetItem.SetRange("No.", "Service/Item Code");
                if GetItem.Find('-') then begin

                    Description := GetItem.Description;
                    "Unit of Measure" := GetItem."Base Unit of Measure";
                    "Unit of Measure Code" := GetItem."Base Unit of Measure";
                    GetItem.TestField("Gen. Prod. Posting Group");
                    "Gen. Prod. Posting Group" := GetItem."Gen. Prod. Posting Group";
                    if GetItem."Unit Cost" <> 0 then begin
                        "Unit Cost" := GetItem."Unit Cost";
                        "Direct Unit Cost" := GetItem."Unit Cost";
                        "Line Amount" := "Qty. Requested" * "Direct Unit Cost";
                        Amount := "Qty. Requested" * "Direct Unit Cost";
                        "Amount Including VAT" := "Qty. Requested" * "Direct Unit Cost";
                    end else begin
                        "Unit Cost" := GetItem."Last Direct Cost";
                        "Direct Unit Cost" := GetItem."Last Direct Cost";
                        "Line Amount" := "Qty. Requested" * "Direct Unit Cost";
                        Amount := "Qty. Requested" * "Direct Unit Cost";
                        "Amount Including VAT" := "Qty. Requested" * "Direct Unit Cost";
                    end;
                    "Unit of Measure" := GetItem."Base Unit of Measure";
                    "Unit of Measure Code" := GetItem."Base Unit of Measure";

                    // Validate("Gen. Prod. Posting Group");
                end;

                Phead.Reset();
                Phead.SetRange("No.", rec."Document No.");
                if Phead.FindFirst() then
                    // Phead.testfield(Phead."Location Code");
                    "Location Code" := Phead."Location Code";
                //IF (Category=Category::Item) OR (Category=Category::Service)THEN BEGIN


                // GetItem.Reset;
                // GetItem.SetRange("No.", "Service/Item Code");
                // if GetItem.Find('-') then begin
                //     Description := GetItem.Description;
                //     "Unit of Measure" := GetItem."Base Unit of Measure";
                //     //"Unit of Measure Code":=Item."Unit of Measure Id";

                // end;

                // VALIDATE("No.");
                //"Service/Item Code" := "No.";
                //"Item Category":="Posting Group";


                //  if PurchLine2.Get("Document Type", "Document No.", "Line No.") then begin

                //  Modify;
            end;

            //END;
            //Validate("Qty. Requested");

            //  end;
        }
        field(50007; "Partially Issued"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50008; "Fully Issued"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50009; "Quantity  issued"; Decimal)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(50010; "Quantity In Store"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No.")/* ,
                                                                  "Location Code" = field("Location Code") */));
            Caption = 'Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50011; "Qty. on Purch. Order"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Outstanding Qty. (Base)" where("Document Type" = const(Order),
                                                                               Type = const(Item),
                                                                               "No." = field("No.")));
            Caption = 'Qty. on Purch. Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50012; "Qty on Requisition"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50013; "PO Number"; Code[20])
        {
            TableRelation = "Purchase Header"."No." where("Document Type" = filter(Order),
                                                           Status = const(Open));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Modify(false);
            end;
        }
        field(50014; Select2; Boolean)
        {
            Caption = 'Select';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //Ushindi
                Modify(false);
                TestField("PO Type");
                TestField("Buy-from Vendor No.");
                "Selected By" := UserId;
            end;
        }
        field(50015; Ordered; Boolean)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Modify(false);
            end;
        }
        field(50016; "Preferred Supplier"; Code[10])
        {
            TableRelation = Vendor;
            DataClassification = CustomerContent;
        }
        field(50017; "Ordered by"; Code[50])
        {
            TableRelation = User."User Name";
            DataClassification = CustomerContent;
        }
        field(50018; "Order Creation date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50019; "Order Creation Time"; Time)
        {
            DataClassification = CustomerContent;
        }
        field(50020; "Last Issued By"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(50021; "Last Issue date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50022; "Last Issue Time"; Time)
        {
            DataClassification = CustomerContent;
        }
        field(50023; "Budget Amount"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50024; "Actual To Date"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50025; "Requisition Type"; Option)
        {
            OptionCaption = ' ,Internal Use,Project,Stock Replenishment,Technical Installation,Technical Maintenance,Stock Return';
            OptionMembers = " ","Internal Use",Project,"Stock Replenishment","Technical Installation","Technical Maintenance","Stock Return";
            DataClassification = CustomerContent;
        }
        field(50026; "Customer No."; Code[10])
        {
            TableRelation = Customer;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //Ushindi


                if "Requisition Type" = "requisition type"::"Internal Use" then begin
                    Error('Your requisition is for Internal use.You cannot fill in this field!!');
                    Modify := false;
                end;


                if "Requisition Type" = "requisition type"::"Stock Replenishment" then begin
                    Error('Your requisition is for Stock Replenishment.You cannot fill in this field!!');
                    Modify := false;
                end;
            end;
        }
        field(50027; "Requisition No."; Code[10])
        {
            CalcFormula = lookup("Purchase Line"."Document No." where("Document Type" = const("Store Requisition"),
                                                                       Type = field(Type),
                                                                       "PO Number" = field("Document No."),
                                                                       "No." = field("No.")));
            FieldClass = FlowField;
        }
        field(50028; "Employee No"; Code[10])
        {
            TableRelation = Employee."No.";
            DataClassification = CustomerContent;
        }
        field(50029; "Employee Name"; Text[100])
        {
            CalcFormula = lookup(Customer.Name where("No." = field("Employee No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; "Item Category"; Code[20])
        {
            TableRelation = "Procurement Category".Code;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin

                if ("Document Type" = "document type"::"Store Requisition") then begin
                    //Category:=Category::Item;
                    Validate(Category);
                    // PurchHeader.Reset;
                    // PurchHeader.SetRange("No.", "Document No.");
                    // if PurchHeader.FindSet then
                    //     "Location Code" := PurchHeader."Location Code";
                end;
                //INSERT(TRUE);
            end;
        }
        field(50031; VendorName; Text[100])
        {
            CalcFormula = lookup("Purchase Header"."Buy-from Vendor Name" where("Document Type" = field("Document Type"),
                                                                                 "No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(50032; Branch; Code[20])
        {
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
                                                                                     "Dimension Code" = const('BRANCH')));
            FieldClass = FlowField;
        }
        field(50033; Department; Code[20])
        {
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
                                                                                     "Dimension Code" = const('DEPARTMENT')));
            FieldClass = FlowField;
        }
        field(50034; "G/L Name"; Text[60])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("No.")));
            FieldClass = FlowField;
        }
        field(50035; "IR Approval History"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(50036; "Selected By"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(50037; "Qty. Requested"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin

                TestStatusOpen;

                Validate("Direct Unit Cost");
                Quantity := "Qty. Requested";
                //"Line Amount":="Qty. Requested"*"Direct Unit Cost";

                if "Document Type" = "document type"::"Purchase Requisition" then begin





                    ProcurementPlan.Reset;
                    ProcurementPlan.SetRange(ProcurementPlan."Plan Item No", "Procurement Plan Item");
                    if ProcurementPlan.Find('-') then begin
                        if ProcurementPlan."Procurement Type" = ProcurementPlan."procurement type"::Goods then
                            Category := Category::Item
                        else
                            if ProcurementPlan."Procurement Type" = ProcurementPlan."procurement type"::Service then
                                Category := Category::Service;

                        ProcurementPlan.CalcFields("Approved Budget", Commitment, Actual);
                        "Vote Amount" := ProcurementPlan."Approved Budget";
                        "Budget Commitments" := ProcurementPlan.Commitment;
                        "Available Funds" := "Vote Amount" - ProcurementPlan.Actual - "Budget Commitments";

                        //Description:=ProcurementPlan."Item Description";
                        "Unit of Measure" := ProcurementPlan."Unit of Measure";
                        "Unit Cost" := ProcurementPlan."Unit Cost";
                        //Budgeted:=BudgetLines.Amount;
                        "Budget Amount" := ProcurementPlan."Approved Budget";
                        //"Direct Unit Cost":=ProcurementPlan."Unit Cost";
                        // Validate("Direct Unit Cost");
                        /*   IF Category=Category::Service THEN BEGIN
                         "Qty. Requested":=ProcurementPlan.Quantity;
                         Quantity:=ProcurementPlan.Quantity;;
                         END;*/
                        //"Line Amount":="Qty. Requested"*"Direct Unit Cost";

                    end;
                end;

                //Fred
                // "Qty Approved" := "Qty. Requested";

            end;
        }
        field(50038; "Include in Purch. Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50039; "Request-By No."; Code[10])
        {
            TableRelation = Employee."No.";
            DataClassification = CustomerContent;
        }
        field(50040; "Request-By Name"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50041; "Quantity Rejected"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin

                /*
             //RGK CHECK IF CURRENT USER HAS RIGHTS EDIT THIS FIELD
             UserSetup.SETFILTER(UserSetup."User ID",'%1',USERID);
             IF UserSetup.FINDFIRST THEN BEGIN
               IF UserSetup."Perform Purchase Inspection"<>TRUE THEN
                  ERROR(AAA01);
             END ELSE BEGIN
               EXIT;
             END;
              */

            end;
        }
        field(50042; "Quantity Returned"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin

            end;
        }
        field(50043; "Requestor ID"; Code[50])
        {
            CalcFormula = lookup("Purchase Header".Test where("Document Type" = field("Document Type"),
                                                               "No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50044; "IR Line Reference"; Code[35])
        {
            DataClassification = CustomerContent;
        }
        field(50045; "Requisition Header Type"; Option)
        {
            Description = '//Ushindi...Lookup IR Type from Header';
            FieldClass = Normal;
            OptionCaption = ' ,Internal Use,Project,Stock Replenishment,Technical Installation,Technical Maintenance,Stock Return';
            OptionMembers = " ","Internal Use",Project,"Stock Replenishment","Technical Installation","Technical Maintenance","Stock Return";
            DataClassification = CustomerContent;
        }
        field(50046; "Project Description"; Code[250])
        {
            CalcFormula = lookup(Job.Description where("No." = field("Job No.")));
            FieldClass = FlowField;
        }
        field(50050; "Remaining Quantity"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No.")));
            FieldClass = FlowField;
        }
        field(50061; "PO Type"; Option)
        {
            OptionCaption = ' ,LSO,LPO';
            OptionMembers = " ",LSO,LPO;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Decision := Decision::Order;
            end;
        }
        field(50062; Decision; Option)
        {
            OptionCaption = ' ,Order';
            OptionMembers = " ","Order";
            DataClassification = CustomerContent;
        }
        field(50063; "TRF Unit of measue"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50064; "Type of Vehicle"; Code[20])
        {
            TableRelation = "Transport Method".Code;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
            end;
        }
        field(50065; "Vehicle Description"; Text[100])
        {
            CalcFormula = lookup("Transport Method".Description where(Code = field("Type of Vehicle")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50066; "Date From"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50067; "To Date"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                // Description:="Vehicle Description";
                // VALIDATE("Date From");
                // IF ("To Date")<("Date From") THEN
                //  ERROR(Text0010);
            end;
        }
        field(50068; "External Doc No"; Code[20])
        {
            CalcFormula = lookup("Purchase Header"."Vendor Order No." where("No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(50069; "Vote Item"; Code[20])
        {
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;
        }
        field(50070; "Vote Amount"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50071; "Available Funds"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50072; "Budget Commitments"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50073; "Approved Requisition Amount"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50074; "Approved Unit Cost"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Validate("Direct Unit Cost", "Approved Unit Cost");
            end;
        }
        field(70000; "Procurement Plan"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Header".No;
        }
        field(70001; "Procurement Plan Item"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan1"."Plan Item No" where("Plan Year" = field("Procurement Plan"),
                                                                      "Department Code" = field("Department Code"));

            trigger OnValidate()
            begin

                ProcurementPlan.Reset;
                ProcurementPlan.SetRange(ProcurementPlan."Plan Item No", "Procurement Plan Item");
                if ProcurementPlan.Find('-') then begin
                    /*IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN BEGIN
                      Type:=Type::Item;
                      "No.":=ProcurementPlan."No.";
                    END;
                    IF ProcurementPlan."Procurement Type"<>ProcurementPlan."Procurement Type"::Service THEN BEGIN
                     Type:=Type::"G/L Account";
                     "No.":=ProcurementPlan."Source of Funds";
                    END;*/
                    //"Budget Line":=ProcurementPlan."Source of Funds";
                    /*Type:=Type::Item;
                   "No.":=ProcurementPlan."No.";*/
                    /*
                     Description:=ProcurementPlan."Item Description";
                    "Unit of Measure":=ProcurementPlan."Unit of Measure";
                    Amount:=ProcurementPlan."Estimated Cost";
                    //"Unit Cost":=ProcurementPlan."Unit Cost";
                     //Budgeted:=BudgetLines.Amount;
                   "Budget Amount":=ProcurementPlan."Estimated Cost";*/

                end;

                ProcurementPlan.Reset;
                //ProcurementPlan.SETRANGE("Plan Year","Procurement Plan");
                ProcurementPlan.SetRange("Plan Item No", "Procurement Plan Item");
                if ProcurementPlan.FindSet then begin
                    "General Item Category" := ProcurementPlan.Category;
                    if ProcurementPlan."Procurement Type" = ProcurementPlan."procurement type"::Goods then
                        "General Item Category" := 'GOODS';
                    if ProcurementPlan."Procurement Type" = ProcurementPlan."procurement type"::Service then begin
                        "Qty. Requested" := ProcurementPlan.Quantity;

                        "General Item Category" := 'Service';
                    end;
                    if ProcurementPlan."Procurement Type" = ProcurementPlan."procurement type"::Works then
                        "General Item Category" := 'Works';
                    "Item Category" := ProcurementPlan.Category;
                    // "Job No." := ProcurementPlan."Job ID";
                    // "Job Task No." := ProcurementPlan."Job Task No.";
                    //"Qty. Requested":=1;
                    if GeneralItem.Get("Item Category") then begin
                        //"Service/Item Code":=GeneralItem.Code;
                        Item.Reset;
                        Item.SetRange("No.", "Service/Item Code");
                        if Item.Find('-') then begin
                            Description := Item.Description;
                        end;
                        Type := Type::Item;
                        "No." := "Service/Item Code";
                    end;
                end;

            end;
        }
        field(70002; "Requisition Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ",Approved,Rejected;
        }
        field(70003; "Requisition Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70004; "Requisition Type1"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Purchase Requisition,Store Requisition,Imprest,Claim-Accounting,Appointment,Payment Voucher';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Purchase Requisition","Store Requisition",Imprest,"Claim-Accounting",Appointment,"Payment Voucher";
        }
        field(70005; Committed; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70006; "Request Generated"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70007; "Process Type"; Code[10])
        {
            CalcFormula = lookup("Purchase Header"."Process Type" where("No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(70008; "Contract No"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(70009; "Activity Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',WorkPlan,Admin & PE,Proc Plan';
            OptionMembers = ,WorkPlan,"Admin & PE","Proc Plan";

            trigger OnValidate()
            begin
                /*
                CashMngt.GET;
                GLSetup.GET;
                "Current Budget":=GLSetup."Current Budget";
                //message('%1',"Current Budget");
                */

            end;
        }
        field(70010; Activity; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70011; "Current Budget"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "G/L Budget Name";
        }
        field(70012; "BD Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70013; "Purchase Type"; Code[30])
        {
            CalcFormula = lookup("Purchase Header"."Process Type" where("No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(70014; "Requisition No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Requisition Header1";
        }
        field(70015; "Department Code"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
            DataClassification = CustomerContent;
        }
        field(70016; "Directorate Code"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
            DataClassification = CustomerContent;
        }
        field(70017; Division; Code[50])
        {
            Description = 's';
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
            DataClassification = CustomerContent;
        }
        field(70027; "General Item Category"; Code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = "General Item Categories".Code;
        }
        field(70028; "Item Description"; Text[60])
        {
            DataClassification = CustomerContent;
        }
        field(70029; Specifications; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70030; "Direct Unit Cost Inc. VAT"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "Direct Unit Cost" := "Direct Unit Cost Inc. VAT";
                Validate("Direct Unit Cost");
            end;
        }
        field(70031; "Entry No"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(70032; "Workplan Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = CustomerContent;
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field("Job No."),
                                                             "Global Dimension 1 Code" = field("Shortcut Dimension 1 Code"));

            // trigger OnValidate()
            // begin
            //     Validate("Job Task No.", "Workplan Task No.");
            // end;
        }
        field(70033; "Ordered PRN"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70034; "Linked IFS No."; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70035; "Linked LPO No."; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70036; "Procurement Plan ID"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan".Code;
        }
        field(90216; "Other Procurement Methods"; Text[100])
        {
            Caption = 'Alternative Procurement Methods';

        }
        field(70037; "Procurement Plan Entry No"; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan Entry"."Entry No." where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                        "Planning Category" = field("PP Planning Category"),
                                                                        Blocked = const(false));

            trigger OnValidate()
            var
                GeneralItem: Record "Item Category";
                PPlanEntry: Record "Procurement Plan Entry";
                Availlable: Decimal;
            begin
                PPlanEntry.Reset;
                PPlanEntry.SetRange("Procurement Plan ID", "Procurement Plan ID");
                PPlanEntry.SetRange("Entry No.", "Procurement Plan Entry No");
                if PPlanEntry.Find('-') then begin
                    //MESSAGE(FORMAT(PPlanEntry."Entry No."));
                    // PPlanEntry.CalcFields("Total Purchase Commitments");
                    if PPlanEntry."Plan Item Type" = PPlanEntry."plan item type"::Item then begin
                        Type := Type::Item;
                        Item.Reset;
                        Item.SetRange("No.", PPlanEntry."Plan Item No");
                        if Item.Findfirst then begin
                            "Unit of Measure" := Item."Base Unit of Measure";
                            "Unit of Measure Code" := Item."Base Unit of Measure";
                            Rec."Direct Unit Cost Inc. VAT" := PPlanEntry."Unit Cost";
                            "Direct Unit Cost" := PPlanEntry."Unit Cost";
                        end;
                    end;
                    if PPlanEntry."Plan Item Type" = PPlanEntry."plan item type"::"Fixed Asset" then begin
                        Type := Type::"Fixed Asset";
                    end;
                    if PPlanEntry."Plan Item Type" = PPlanEntry."plan item type"::" " then begin
                        Error('Error! Ensure the Procurement Plan votes are Linked to the Items')
                    end;
                    "No." := PPlanEntry."Plan Item No";
                    Description := PPlanEntry.Description;
                    "PP Funding Source ID" := PPlanEntry."Funding Source ID";
                    // "Shortcut Dimension 2 Code" := PPlanEntry."Funding Source ID";
                    "PP Total Budget" := PPlanEntry."Line Budget Cost";
                    // "Item Category Code" := PPlanEntry."Planning Category";
                    "Item Category Code" := PPlanEntry."Item Category Code";
                    PPlanEntry.CalcFields("Total Actual Costs");
                    "PP Total Actual Costs" := PPlanEntry."Total Actual Costs";
                    // PPlanEntry.CalcFields("Total Purchase Commitments");
                    // PPlanEntry.CalcFields("Total Purchase Invoices");
                    PPlanEntry.CalcFields("Total PRN Commitments");
                    // PPlanEntry.CalcFields("Total PO Commitments");
                    // "PP Total Commitments" := PPlanEntry."Total Purchase Commitments";
                    "PP Solicitation Type" := PPlanEntry."Solicitation Type";
                    "PP Procurement Method" := PPlanEntry."Procurement Method";
                    "Other Procurement Methods" := PPlanEntry."Other Procurement Methods";

                    Availlable := PPlanEntry."Line Budget Cost" - PPlanEntry."Total PRN Commitments";
                    if availlable > 0 then begin
                        "PP Total Available Budget" := Availlable;
                    end else begin
                        "PP Total Available Budget" := 0;
                    end;
                    "PP Preference/Reservation Code" := PPlanEntry."Preference/Reservation Code";
                    //"Job No.":=PPlanEntry."Budget Control Job No";
                    //"Job Task No.":=PPlanEntry."Budget Control Job Task No.";
                    "Budget Line" := PPlanEntry."Budget Account";
                end;
            end;
        }
        field(70038; "Quantity Partial Issued"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(75002; Awarded; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(75003; "IFS Created"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(75004; Selected; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(75005; "PP Planning Category"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan Entry"."Planning Category";
        }
        field(75006; "PP Funding Source ID"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan Entry"."Funding Source ID";
        }
        field(75007; "PP Total Budget"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(75008; "PP Total Actual Costs"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(75009; "PP Total Commitments"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(75010; "PP Total Available Budget"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(75011; "PP Solicitation Type"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Solicitation Type".Code;
        }
        field(75012; "PP Procurement Method"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(75013; "PP Preference/Reservation Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Special Vendor Category".Code;
        }
        field(75014; "PRN Conversion Procedure"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Invitation For Supply,Direct PO';
            OptionMembers = "Invitation For Supply","Direct PO";
        }
        field(75015; "Requisition Product Group"; Option)
        {
            DataClassification = CustomerContent;
            Description = 'New field used to categorize the Items further into Goods, Works, Services and Assets. NB: In most organizations, the Works, Services and Assets shall be setup under TYPE:SERVICE';
            OptionCaption = 'Goods,Services,Works,Assets';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(75018; "Technical Specifications"; Text[2000])
        {
            DataClassification = CustomerContent;
        }
        field(75019; "Qty Approved"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(75020; "Remarks"; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(75021; "Item Details"; Text[2000])
        {
            DataClassification = CustomerContent;
        }
        field(75022; "Allocated Quantity"; Decimal)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(75023; "Budget"; Code[50])
        {
            DataClassification = CustomerContent;
            // TableRelation = Job;
            caption = 'Financial Budget';
            TableRelation = "G/L Budget Name".Name;

        }

        field(75001; "Budget Line"; Code[20])
        {
            Caption = 'Budget Line';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account"."No." where(Blocked = const(false));
        }
        field(8603700; Test; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(99000761; "Fee Type"; Text[30])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
    }



    trigger OnAfterInsert()
    var
        myInt: Integer;
        PurchHeader: Record "Purchase Header";
        PPlan: Record "Procurement Plan";
    begin

        if "Document Type" = "Document Type"::"Purchase Requisition" then begin
            //    UserSetup.RESET;
            //    UserSetup.SETRANGE("User ID",USERID);
            //    IF UserSetup.FINDFIRST THEN BEGIN
            //      IF UserSetup."Portal User"=FALSE THEN BEGIN
            PurchHeader.RESET;
            PurchHeader.SETRANGE("No.", "Document No.");
            PurchHeader.SETRANGE("Document Type", Rec."Document Type"::"Purchase Requisition");
            if PurchHeader.FINDSET then
                if (PurchHeader."Procurement Plan ID" = '') or (PurchHeader."PP Planning Category" = '') then begin
                    ERROR('ERROR! Kindly ensure you have selected the Procurement Plan and Planning Category on your purchase Requisition');
                end;
            "Procurement Plan ID" := PurchHeader."Procurement Plan ID";
            "PP Planning Category" := PurchHeader."PP Planning Category";
            "Directorate Code" := PurchHeader."Directorate Code1";
            "Department Code" := PurchHeader."Department Code";
            "Requisition Product Group" := PurchHeader."Requisition Product Group";
            "Shortcut Dimension 1 Code" := PurchHeader."Shortcut Dimension 1 Code";
            "Shortcut Dimension 2 Code" := PurchHeader."Shortcut Dimension 2 Code";
            if (PurchHeader.Job = '') or (PurchHeader."Job Task No." = '') then begin
                ERROR('ERROR! Kindly ensure you have linked the Budget and Budget Vote on your purchase Requisition');
            end;

            PPlan.Reset();
            PPlan.SetRange(Code, PurchHeader."Procurement Plan ID");
            if PPlan.FindFirst() then
                "Budget" := PPlan."Financial Budget ID";

            "Budget Line" := PurchHeader."Job Task No.";
            MODIFY(TRUE);
            //  END;
            //  END;

            Rec.CalcFields("Quantity In Store")
        end;
        //     IF GeneralItem.GET("Item Category") THEN BEGIN
        //     //"Service/Item Code":=GeneralItem.Code;
        //     Item.RESET;
        //   Item.SETRANGE("No.","Service/Item Code");
        //   IF Item.FIND('-') THEN BEGIN
        //      Description:=Item.Description;
        //   END;
        //   Type:=Type::Item;
        //   "No.":="Service/Item Code";
        //   //VALIDATE("No.");

        //     //VALIDATE("Service/Item Code");
        //     END;

    end;

    var

        GLPostCheckLineCDU: Codeunit "Gen. Jnl.-Check Line";
        GLAccCode: Code[20];
        GDimensions: array[8] of Code[20];
        GPostDate: Date;
        GBusUnitCode: Code[20];
        GCurrFactor: Decimal;
        UserSetup: Record "User Setup";
        Service: Record "Service Items";
        Jobs: Record Job;
        qty: Decimal;
        UoM: Record "Item Unit of Measure";
        Text055: label 'You have exceeded availble budget by KES %1, Please seek advice from accounts and finance department';
        "...........................Bcommitments................................": Integer;
        fAsset: Record "Fixed Asset";
        //Bcommitments: Record "Budget Commitment";
        cSetup: Record "Human Resources Setup";
        gEntry: Record "G/L Entry";
        actualAmount: Decimal;
        ProcurementPlan: Record "Procurement Plan1";
        Item: Record Item;
        GeneralItem: Record "Item Category";
        "----------Editable.............................................................": Integer;
        AmountEditable: Boolean;
        LineAmountEditable: Boolean;
        QuantityEditable: Boolean;
}

