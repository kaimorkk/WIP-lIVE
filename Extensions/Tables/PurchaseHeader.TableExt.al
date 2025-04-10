TableExtension 52193440 tableextension52193440 extends "Purchase Header"
{
    fields
    {

        modify(Status)
        {
            trigger OnAfterValidate()
            begin
                if Rec.Status = Rec.Status::Released then begin
                    if "Document Type" = "Document Type"::"Store Requisition" then begin
                        PostStoreReqLines();
                    end;
                end;
            end;
        }
        field(50026; "Procurement Plan Year"; Code[10])
        {
        }
        
        field(50050; "Plan Item No"; Code[10])
        {
        }
        field(50128; "Contract No"; Code[10])
        {
        }
        field(50129; "No of Approvals"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Table ID" = const(38),
                                                        "Document No." = field("No.")));
            FieldClass = FlowField;
        }
        field(50130; "External Approval Ref"; Option)
        {
            OptionMembers = CTC,CPC,MEMO,CONTRACT;
        }
        field(50131; "External Approval No"; Code[20])
        {
        }
       
        field(50033; "Expiry Date"; Date)
        {
        }
        field(50034; "Extension Date"; Date)
        {
        }
        field(50035; "Invoice Amount"; Decimal)
        {
        }
        field(50036; "Penalty Computed"; Boolean)
        {
        }
        field(50037; "Training Request N."; Code[20])
        {
            TableRelation = "Training Request1";
        }
        field(50038; "Manual VAT Amount"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Amt. Rcd. Not Invoiced (LCY)" where("Document Type" = field("Document Type"),"Document No." = field("No.")));
            FieldClass = FlowField;
        }
        field(50039; "Quotation No"; Code[50])
        {

            trigger OnValidate()
            begin

            end;
        }
        
        field(50040; Printed; Boolean)
        {
        }
        field(50134; "Delivery Note Number"; Code[20])
        {
        }
        field(50000; Copied; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Debit Note"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50002; "Fully Issued"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50003; "Partially Issued"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50004; "Cancelled?"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50005; "Project?"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50006; "Send To PM"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50007; "Sent By"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = User;
        }
        field(50008; "Sending Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50009; "Store No"; Code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = Table0.Field12143624;

            trigger OnValidate()
            begin
               

            end;
        }
        field(50010; Replenishment; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50011; Description; Text[250])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                
            end;
        }
        field(50012; "Requisition Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Internal Use,Project,Stock Replenishment,Technical Installation,Technical Maintenance,Stock Return,Tyre';
            OptionMembers = " ","Internal Use",Project,"Stock Replenishment","Technical Installation","Technical Maintenance","Stock Return",Tyre;

            trigger OnValidate()
            begin

                TestField(Status, Status::Open);
               

            end;
        }
        field(50013; "Taken By"; Code[60])
        {
            DataClassification = CustomerContent;
        }
        field(50014; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50015; "Project Name"; Code[60])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Valid to Date"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
            begin
                /*
               //CMM 271008 CHECK RIGHTS TO CHANGE VALIDITY DATE
                  IF ("Valid to Date" <> xRec."Valid to Date") AND (xRec."Valid to Date"<>0D) THEN BEGIN
                     IF UserSetup.GET(USERID)  THEN
                         IF UserSetup."Extend Purch. Quote/LPO Period" <> TRUE THEN
                           ERROR('You do not have suuficient rights to change the validity date');
                  END;
               //END CMM
                 */

            end;
        }
        field(50017; "Request-By No."; Code[90])
        {
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin


                //CAW 240908 EALAYER
                Empl.Get("Request-By No.");
                "Request-By Name" := Empl.FullName;
                "Shortcut Dimension 1 Code" := Empl."Global Dimension 1 Code";
                "Shortcut Dimension 2 Code" := Empl."Global Dimension 2 Code";
                //"Location Code" := Empl."Global Dimension 1 Code";
                //;
                //Validate("Shortcut Dimension 1 Code");
                //Validate("Shortcut Dimension 2 Code");

                TestField(Status, Status::Open);
                // if ("Request-By No." <> xRec."Request-By No.") and
                //  (xRec."Request-By No." <>'')
                //  then begin
                //   if HideValidationDialog then
                //     Confirmed := true
                //   else
                //     Confirmed := Confirm(ConfirmChangeQst,false,FieldCaption("Request-By No."));

                //       if Confirmed then begin
                //         PurchLine.SetRange("Document Type","Document Type");
                //         PurchLine.SetRange("Document No.","No.");
                //            if "Request-By No." = '' then begin
                //              if not PurchLine.IsEmpty then begin
                //                Error(
                //                Text005,
                //                FieldCaption("Request-By No."));
                //                Init;
                //                PurchSetup.Get;
                //               "No. Series" := xRec."No. Series";
                //                InitRecord;
                //              end;

                //    if xRec."Posting No." <> '' then begin
                //       "Posting No. Series" := xRec."Posting No. Series";
                //       "Posting No." := xRec."Posting No.";
                //    end;

                //    if ("Document Type" = "document type"::"Store Requisition") or ("Document Type"="document type"::"IEC Materials") then
                //       PurchLine.SetFilter("Qty. Requested",'<>0');
                //    end;

                // PurchLine.Reset;

                // end else begin
                // Rec := xRec;
                // exit;

                //  end;
            end;
            // end;
        }
        field(50018; "Request-By Name"; Text[50])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50019; "Requester ID"; Code[50])
        {
            DataClassification = CustomerContent;
            Editable = true;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(50020; "Purchase Requisition No."; Code[20])
        {
            DataClassification = CustomerContent;
            Enabled = false;
        }
        field(50021; "Created Quotes"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50022; "Store Requisition No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50023; "Budgeted  Name"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "G/L Budget Name";
        }
        field(50024; "Requisition Expense Group"; Code[10])
        {
            Caption = 'Requisition Expense Group';
            DataClassification = CustomerContent;
            Description = '//Track IR Expense A/C---Used to map to Inv Adj A/c...Ushindi';
            // TableRelation = "Gen. Business Posting Group" where("Auto Link Internal Requisition" = const(true));

        }
        field(50025; "ChargeToWork?"; Boolean)
        {
            DataClassification = CustomerContent;
            Description = '//Track CTW IRs....Ushindi';

            trigger OnValidate()
            begin

                /*
                //Ushindi changes.....21st Jan 2015

               //Ensure all CTW IRs have the relevant CTW Expense Group
               TESTFIELD("Requisition Expense Group");
               //CTW IR should not be linked to Stock Replenishment IR Type
               IF "Requisition Type"="Requisition Type"::"Stock Replenishment"
               THEN ERROR('Charge To Work IRs can not be tied to Stock Replenishment Type, Please check!');
                */

            end;
        }
        field(50027; "Beneficiary Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50028; "Beneficiary Address"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50029; "Beneficiary Address 2"; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(50030; "Beneficiary City"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50031; "IR External Document No"; Code[35])
        {
            DataClassification = CustomerContent;
            Description = 'Track External Doc No';
        }
        field(50061; "PO Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,LSO,LPO';
            OptionMembers = " ",LSO,LPO;
        }
        field(50069; "Vote Item"; Code[20])
        {
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "G/L Account";
        }
        field(50070; "Vote Amount"; Decimal)
        {
            CalcFormula = lookup("G/L Budget Entry".Amount where("G/L Account No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50072; "Budget Commitments"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Budget Commitments" where("Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        // field(51001; "Inspection Team Setup?"; Boolean)
        // {
        //     CalcFormula = exist("Goods & Services Inspection" where("No." = field("No."),
        //                                                              "Vendor Shipment No." = field("Vendor Shipment No.")));
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        // field(51002; "Inspection Completed?"; Boolean)
        // {
        //     CalcFormula = - exist("Goods & Services Inspection" where("No." = field("No."),
        //                                                               Decision = filter(" " | Rejected),
        //                                                               "Vendor Shipment No." = field("Vendor Shipment No.")));
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        field(59000; "Contract No."; Code[25])
        {
            DataClassification = CustomerContent;
        }
        field(59001; "Contract Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(59009; "Sending Time"; Time)
        {
            DataClassification = CustomerContent;
        }
        field(59021; "Job Task No."; Code[20])
        {
            Caption = 'Budget Line';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account"."No." where(Blocked = const(false));
            //TableRelation = "G/L Budget Entry"."Entry No." where("Budget Name" = field("Job"), "Global Dimension 1 Code" = FIELD("Shortcut Dimension 1 Code"), "Global Dimension 2 Code" = FIELD("Shortcut Dimension 2 Code"));

            // TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job),
            //                                                  "Job Task Type" = const(Posting));

            trigger OnValidate()
            begin
                /*
                TESTFIELD("Receipt No.",'');
                
                IF "Job Task No." <> xRec."Job Task No." THEN BEGIN
                  VALIDATE("Job Planning Line No.",0);
                  IF "Document Type" = "Document Type"::Order THEN
                    TESTFIELD("Quantity Received",0);
                END;
                
                IF "Job Task No." = '' THEN BEGIN
                  CLEAR(JobJnlLine);
                  "Job Line Type" := "Job Line Type"::" ";
                  UpdateJobPrices;
                  EXIT;
                END;
                
                JobSetCurrencyFactor;
                IF JobTaskIsSet THEN BEGIN
                  CreateTempJobJnlLine(TRUE);
                  UpdateJobPrices;
                END;
                UpdateDimensionsFromJobTask;
                
                */

            end;
        }
        field(59024; "Budget Item"; Code[20])
        {
            CalcFormula = lookup("Purchase Line"."Vote Item" where("Document No." = field("No.")));
            Caption = 'Job No.';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = Job;

            trigger OnValidate()
            var
                Job: Record Job;
            begin
                

            end;
        }
        field(59025; "Buget Desc"; Text[50])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("Budget Item")));
            FieldClass = FlowField;
        }
        field(59030; "Budgeted Amount"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Vote Amount" where("Document No." = field("No.")));
            Description = '//daudi changed for schedule to Budget as per the new structure';
            Editable = false;
            FieldClass = FlowField;
        }
        field(59031; "Actual Budget Costs"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Actual To Date" where("Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59033; "Available Funds"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Available Funds" where("Document No." = field("No.")));
            FieldClass = FlowField;
        }
        field(59034; "Requisition Amount"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document Type" = field("Document Type"),
                                                                   "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59035; "Remaining Budget"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(59036; "Required Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(59037; "Function Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Description = 'Stores the name of the function in the database';
        }
        field(59038; "Budget Center Name"; Text[45])
        {
            DataClassification = CustomerContent;
            Description = 'Stores the name of the budget center in the database';
        }
        field(59039; "Store Requisition Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ",Item,"Minor Asset";
        }
        field(59040; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(59041; "Unit  Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 3 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59042; "Total Project Cost"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(59043; Harvest; Boolean)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //VALIDATE("Budget Item");
            end;
        }
        field(59044; "Procurement Type"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Types".Code;
        }
        field(59045; "Contract Number"; Code[25])
        {
            DataClassification = CustomerContent;
        }
        field(59046; "Date received"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(59047; "Approved Requisition Amount"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69013; "Order types"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'LPO,LSO';
            OptionMembers = LPO,LSO;
        }
        field(69020; "Reason to reopen"; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(69021; "Reason to Cancel"; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(69022; "Order Number"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70000; Committed; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70001; CommittedBy; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70002; "Procurement Plan"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Header".No;
        }
        field(70003; "Procurement Plan Item"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan1"."Plan Item No" where("Plan Year" = field("Procurement Plan"));

            trigger OnValidate()
            begin
                PlanItem.Reset;
                PlanItem.SetRange("Plan Item No", "Procurement Plan Item");
                if PlanItem.Find('-') then
                    "Procurement Plan Item Descript" := PlanItem."Item Description";
            end;
        }
        field(70004; "Request Ref No"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(70005; "Supplier Type"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70006; "Process Type"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Method".Code;

            trigger OnValidate()
            begin

                // PurchSetup.Get; //"Max Low Value Proc Amount"

                if "Process Type" <> '' then
                    if Confirm(Text0061, true, "Process Type") then begin
                        ProcCeiling.Reset;
                        ProcCeiling.SetRange(ProcCeiling."Method of Procurement", "Process Type");
                        if ProcCeiling.FindSet then begin
                            CalcFields(Amount);
                            if Amount > ProcCeiling."Maximum Ceiling" then
                                Error(Text0059, "Process Type", ProcCeiling."Maximum Ceiling");
                            if Amount < ProcCeiling."Minimum Ceiling" then
                                Error(Text0060, "Process Type", ProcCeiling."Minimum Ceiling");
                        end;
                    end
                    else
                        "Process Type" := '';
            end;
        }
        field(70007; "Purchase Type"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Purchases Types";
        }
        field(70008; "Requisition No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Purchase Header" where("Document Type" = const("Purchase Requisition"));

            
        }
        field(70009; Ordered; Boolean)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70010; HOD; Boolean)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code1"));
        }
        field(70018; "Directorate Code1"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; Job; Code[50])
        {
            DataClassification = CustomerContent;
            // TableRelation = Job;
            caption = 'Financial Budget';
            TableRelation = "CSP Planned Years"."Annual Year Code";
            // FieldClass=flowfield;
            // CalcFormula

            trigger OnValidate()
            var
                JobRec: Record "CSP Planned Years";
            begin
                JobRec.reset;
                JobRec.setrange(JobRec."Annual Year Code", rec.Job);
                if JobRec.FindFirst() then
                    rec."Job Name" := JobRec.Description;
                // Approver := JobRec."Project Manager";

            end;
        }
        field(70021; "Job Name"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70022; Approver; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup";
        }
        field(70023; "Supplier Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Vendor;

            // trigger OnValidate()
            // begin
            //      if Vend.Get ("Supplier Code") then
            //      Supplier:=Vend.Name;
            // end;
        }
        field(70024; Supplier; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(70025; Specifications; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70026; "Item Category"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Item Category".Code where(Indentation = const(0));

            trigger OnValidate()
            begin
                /*ItemCategory.RESET;
                ItemCategory.SETRANGE("Item No","Item Category Description");
                IF ItemCategory.FIND('-') THEN
                  "Item Category Description":=ItemCategory.Description;*/

            end;
        }
        field(70027; "General Item Category"; Code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = "General Item Categories".Code;
        }
        field(70028; "Archive Requisitions"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70029; Consitituency; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Constituency;
        }
        field(70030; "Priority Level"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Low,Normal,High,Critical';
            OptionMembers = ,Low,Normal,High,Critical;
            InitValue = Normal;
            editable = false;
        }
        field(70031; "Planned Commencement Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70032; "Road Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Fixed Asset";
        }
        field(70033; "Link Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70034; "Works Length (Km)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70035; Region; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(70036; "Funding Agency"; Code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = "Funding Agency";
        }
        field(70037; "Funding Source"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Funding Source";
        }
        field(70038; "Solicitation Type"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70040; "Requisition Product Group"; Option)
        {
            DataClassification = CustomerContent;
            Description = 'New field used to categorize the Items further into Goods, Works, Services and Assets. NB: In most organizations, the Works, Services and Assets shall be setup under TYPE:SERVICE';
            OptionCaption = 'Goods,Services,Works,...';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(70041; "IFS Linked"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70042; "Requisition Template ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Purchase Requisition Template".Code;
        }
        field(70043; "PRN Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Standard,Project Works';
            OptionMembers = Standard,"Project Works";
        }
        field(70044; "Project Staffing Template ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Project Key Staff Template".Code;
        }
        field(70045; "Works Equipment Template ID"; Code[30])
        {
            DataClassification = CustomerContent;
            // TableRelation = "Works Equipment Template".Code;
        }
        field(70046; "Procurement Plan ID"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan".Code where("Plan Type" = const(Consolidated));
        }
        field(70047; "Procurement Plan Entry No"; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = if ("PRN Type" = const(Standard)) "Procurement Plan Entry"."Entry No." where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                                                        "Requisition Product Group" = field("Requisition Product Group"),
                                                                                                        Region = field(Region),
                                                                                                        Directorate = field("Directorate Code1"),
                                                                                                        Department = field("Department Code"),
                                                                                                        "Procurement Use" = const("Standard (Internal Use)"))
            else
            if ("PRN Type" = const("Project Works")) "Procurement Plan Entry"."Entry No." where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                                                                                                                                                "Requisition Product Group" = field("Requisition Product Group"),
                                                                                                                                                                                                Region = field(Region),
                                                                                                                                                                                                Directorate = field("Directorate Code1"),
                                                                                                                                                                                                Department = field("Department Code"),
                                                                                                                                                                                                "Procurement Use" = const("Project-Specific Use"));

            trigger OnValidate()
            begin
                PPlanEntry.Reset;
                PPlanEntry.SetRange(PPlanEntry."Entry No.", "Procurement Plan Entry No");
                if PPlanEntry.Find('-') then begin
                    //MESSAGE(FORMAT(PPlanEntry."Entry No."));
                    // PPlanEntry.CalcFields("Total Purchase Commitments");
                    "PP Planning Category" := PPlanEntry."Planning Category";
                    "Procurement Plan Item Descript" := PPlanEntry.Description;
                    "PP Funding Source ID" := PPlanEntry."Funding Source ID";
                    "Shortcut Dimension 2 Code" := PPlanEntry."Funding Source ID";
                    "PP Total Budget" := PPlanEntry."Line Budget Cost";
                    "PP Total Actual Costs" := PPlanEntry."Total Actual Costs";
                    // "PP Total Commitments" := PPlanEntry."Total Purchase Commitments";
                    "PP Solicitation Type" := PPlanEntry."Solicitation Type";
                    "PP Procurement Method" := PPlanEntry."Procurement Method";
                    "PP Preference/Reservation Code" := PPlanEntry."Preference/Reservation Code";
                    Job := PPlanEntry."Budget Control Job No";
                    "Budget Item" := PPlanEntry."Budget Control Job No";
                    //MESSAGE(Job);
                    "Job Task No." := PPlanEntry."Budget Account";
                    //MESSAGE('job No %1 job task no',Job,"Job Task No.");
                    "PP  Invitation Notice Type" := PPlanEntry."Invitation Notice Type";
                    Consitituency := PPlanEntry.Constituency;

                    SoliType.Reset;
                    SoliType.SetRange(Code, PPlanEntry."Solicitation Type");
                    if SoliType.FindSet then begin
                        "PP Bid Selection Method" := SoliType."Default Bid Selection Method";
                    end;
                end;
                if "Requisition Product Group" = "requisition product group"::Works then
                    Validate("Job Task No.");
            end;
        }
        field(70048; "PP Planning Category"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan Lines"."Planning Category" where("Procurement Plan ID" = field("Procurement Plan ID"));

            trigger OnValidate()
            var
                ProcurCategory: Record "Procurement Category";
                cashmagt: Record "Cash Management Setup";
                pplin: Record "Procurement Plan Lines";
                plans: Record "Procurement Plan Lines";
                ppentry: Record "Procurement Plan Entry";
                PPlan: Record "Procurement Plan";
            begin
                cashmagt.get();
                ProcurCategory.Reset;
                ProcurCategory.SetRange(Code, "PP Planning Category");
                if ProcurCategory.FindSet then begin
                    rec.Description := ProcurCategory.Description;
                    //job := cashmagt."Current Budget";

                    PPlan.Reset();
                    PPlan.SetRange(Code, Rec."Procurement Plan ID");
                    if PPlan.FindFirst() then
                        Job := PPlan."Financial Year Code";

                    "Job Task No." := Rec."PP Planning Category";
                    
                    ppentry.reset();
                    ppentry.setrange("Procurement Plan ID", "Procurement Plan ID");
                    ppentry.setrange("Planning Category", "PP Planning Category");
                    ppentry.setrange("Global Dimension 1 Code", "Shortcut Dimension 1 Code");
                    ppentry.setrange("Global Dimension 2 Code", "Shortcut Dimension 2 Code");
                    if ppentry.findset() then begin
                        ppentry.calcsums("Line Budget Cost");
                        Rec."PP Total Budget" := ppentry."Line Budget Cost";
                    end;
                    // pplin.reset();
                    // pplin.SetRange("Procurement Plan ID", "Procurement Plan ID");
                    // pplin.setrange("Planning Category", "PP Planning Category");
                    // if pplin.findset() then begin
                    //     pplin.calcfields("Total PRN Committments", "Total Budgeted Cost");
                    //     Rec."PP Total Budget" := pplin."Total Budgeted Cost";
                    //     Rec."PP Total Commitments" := pplin."Total PRN Committments";
                    //     Rec."PP Total Available Budget" := pplin."Total Budgeted Cost" - pplin."Total PRN Committments";
                    // end;

                    // "PP Total Budget"
                end;
            end;
        }
        field(70049; "PP Funding Source ID"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan Entry"."Funding Source ID";
        }
        field(70050; "PP Total Budget"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70051; "PP Total Actual Costs"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70052; "PP Total Commitments"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70053; "PP Total Available Budget"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70054; "PP Solicitation Type"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Solicitation Type".Code;
        }
        field(70055; "PP Procurement Method"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(70056; "PP Preference/Reservation Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Special Vendor Category".Code;
        }
        field(70057; "PRN Conversion Procedure"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Invitation For Supply,Direct PO';
            OptionMembers = "Invitation For Supply","Direct PO";
        }
        field(70058; "Ordered PRN"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70059; "Linked IFS No."; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70060; "Linked LPO No."; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70061; "Works Category"; Code[30])
        {
            DataClassification = CustomerContent;
            // TableRelation = "Works Category".Code;

            trigger OnValidate()
            begin
                // WorksCategory.Reset;
                // // WorksCategory.SetRange(Code, "Works Category");
                // if WorksCategory.FindSet then
                //     "Works Description" := WorksCategory.Description;
            end;
        }
        field(70062; "Works Description"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70063; "Total PRN Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70064; "Total PRN Amount (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70065; "PP  Invitation Notice Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Single  Stage Tender,Two Stage Tender,RFQ,Low Value Procurement,Direct Procurement,Framework Agreement,Special RFQ';
            OptionMembers = ,"Single  Stage Tender","Two Stage Tender",RFQ,"Low Value Procurement","Direct Procurement","Framework Agreement","Special RFQ";
        }
        field(70066; "PP Bid Selection Method"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70067; "PRN Order Date/Time"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(70068; "Document Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Draft,Submitted,Withdrawn,Opened,Evaluation,Awarded,Lost,Cancelled';
            OptionMembers = Draft,Submitted,Withdrawn,Opened,Evaluation,Awarded,Lost,Cancelled;
        }
        field(70069; "Bidder Type"; Option)
        {
            DataClassification = CustomerContent;
            Description = 'Bid Response';
            OptionCaption = 'Single Entity,Joint Venture';
            OptionMembers = "Single Entity","Joint Venture";
        }
        field(70070; "Joint Venture Partner"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(70071; "Invitation For Supply No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            var
                MyItem: Record Item;
                MyVendor: Record Vendor;
                CompanyInfo: Record "Company information";
            begin
                if "Document Type" = "document type"::Quote then begin
                    Procurement.UpdateBidResponseFromITT(Rec);
                    IFS.Reset;
                    IFS.SetRange(Code, "Invitation For Supply No");
                    if IFS.FindSet then begin
                        //Purch.INIT;
                        "Document Type" := "document type"::Quote;
                        "Invitation Notice Type" := IFS."Invitation Notice Type";
                        "Bid Envelope Type" := IFS."Bid Envelop Type";
                        "PP Bid Selection Method" := IFS."Bid Selection Method";
                        "PP Procurement Method" := IFS."PP Procurement Method";
                        "PP Solicitation Type" := IFS."PP Solicitation Type";
                        "Procurement Plan ID" := IFS."Procurement Plan ID";
                        "Procurement Plan Entry No" := IFS."Procurement Plan Entry No";
                        "Tender Description" := IFS."Tender Summary";
                        "Tender Name" := IFS."Tender Name";
                        "Responsibility Center" := IFS."Responsibility Center";
                        "Location Code" := IFS."Location Code";
                        "Language Code" := IFS."Language Code";
                        "Purchaser Code" := IFS."Purchaser Code";
                        "Currency Code" := IFS."Currency Code";
                        "IFS Code" := "Invitation For Supply No";
                        "Bid Charge Code" := IFS."Bid Charge Code";
                        "Bid Charge (LCY)" := IFS."Bid Charge (LCY)";
                        "Works Category" := IFS."Works Category";
                        "Road Code" := IFS."Road Code";
                        "Link Name" := IFS."Road Link Name";
                        Consitituency := IFS."Constituency ID";
                        "Engineer Estimate (LCY)" := IFS."Engineer Estimate (LCY)";
                        "Max Works Completion Duration" := IFS."Max Works Completion Duration";
                        "Max Works Kickoff Duration" := IFS."Max Works Kickoff Duration";
                        "Max Works Charter Duration" := IFS."Max Works Charter Duration";
                        // Validate("Payment Terms Code", IFS."Payment Terms Code");
                        "Defects Liability Period" := IFS."Defects Liability Period";
                        "Daily Liquidated Dam Unit Cost" := IFS."Daily Liquidated Dam Unit Cost";
                        "Liquidated Damages Limit %" := IFS."Liquidated Damages Limit %";
                        "Payment Retention %" := IFS."Payment Retention %";
                        "Retention Amount Limit %" := IFS."Retention Amount Limit %";
                        "Min Interim Certificate Amount" := IFS."Min Interim Certificate Amount";
                        CompanyInfo.Get;
                        "Procuring Entity (PE) Name" := CompanyInfo.Name;
                        UserSetup.Get(UserId);
                        "Responsibility Center" := UserSetup."Purchase Resp. Ctr. Filter";

                        PurchLines.Reset;
                        PurchLines.SetRange("Document No.", "No.");
                        if PurchLines.FindSet then begin
                            PurchLines.DeleteAll;
                        end;

                        IFSLines.Reset;
                        IFSLines.SetRange("Standard Purchase Code", "Invitation For Supply No");
                        if IFSLines.FindSet then begin
                            repeat

                                PurchLines.Init;
                                PurchLines."Document Type" := PurchLines."document type"::Quote;
                                PurchLines."Document No." := "No.";
                                PurchLines."Line No." := IFSLines."Line No.";
                                PurchLines.Validate("Buy-from Vendor No.", "Vendor No.");
                                PurchLines.Type := IFSLines.Type;
                                PurchLines."No." := IFSLines."No.";
                                PurchLines."Location Code" := IFS."Location Code";
                                //PurchLines."Posting Group":=IFSLines
                                PurchLines.Description := IFSLines.Description;
                                PurchLines."Technical Specifications" := IFSLines."Technical Specifications";
                                PurchLines."Item Details" := IFSLines.Description;
                                PurchLines."Unit of Measure Code" := IFSLines."Unit of Measure Code";
                                //PurchLines."Unit of Measure":=IFSLines."Unit of Measure Code";
                                //PurchLines.VALIDATE(PurchLines.Description,IFSLines.Description);
                                //PurchLines.VALIDATE(PurchLines.Quantity,IFSLines.Quantity);
                                //MESSAGE('%1',PurchLines.Quantity);
                                PurchLines.Quantity := IFSLines.Quantity;
                                //posting groups
                                MyItem.Reset;
                                MyItem.SetRange("No.", IFSLines."No.");
                                if MyItem.FindSet then begin
                                    PurchLines."Gen. Prod. Posting Group" := MyItem."Gen. Prod. Posting Group";
                                end;
                                MyVendor.Reset;
                                MyVendor.SetRange("No.", "Vendor No.");
                                if MyVendor.FindSet then begin
                                    PurchLines."Gen. Bus. Posting Group" := MyVendor."Gen. Bus. Posting Group";
                                end;
                                //posting groups

                                PurchLines."Shortcut Dimension 1 Code" := IFSLines."Shortcut Dimension 2 Code";
                                PurchLines."Shortcut Dimension 2 Code" := IFSLines."Shortcut Dimension 2 Code";
                                PurchLines."Procurement Plan ID" := IFSLines."Procurement Plan ID";
                                PurchLines."Procurement Plan Entry No" := IFSLines."Procurement Plan Entry No";
                                /*PurchLines."Variant Code":=IFSLines."Variant Code";
                                PurchLines."Dimension Set ID":=IFSLines."Dimension Set ID";
                                PurchLines."Item Category":=IFSLines."Item Category";*/
                                PurchLines.Insert(true);

                            until IFSLines.Next = 0;
                        end;

                    end;
                end;

            end;
        }
        field(70072; "Invitation Notice Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Single  Stage Tender,Two Stage Tender,RFQ,Low Value Procurement';
            OptionMembers = ,"Single  Stage Tender","Two Stage Tender",RFQ,"Low Value Procurement";
        }
        field(70073; "Bid Envelope Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = '1-Envelope,2-Envelope';
            OptionMembers = "1-Envelope","2-Envelope";
        }
        field(70074; "Bid Seal Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Sealed,Unsealed';
            OptionMembers = Sealed,Unsealed;
        }
        field(70075; "Tender Description"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70076; "Bidder Representative Name"; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(70077; "Bidder Representative Desgn"; Code[50])
        {
            Caption = 'Bidder Representative Designation';
            DataClassification = CustomerContent;
            Description = 'Bidder Representative Designation';
        }
        field(70078; "Bidder Representative Address"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(70079; "Bidder Witness Name"; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(70080; "Bidder Witness Designation"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70081; "Bidder Witness Address"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(70082; "Tender Document Source"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Tender Document Source".Code;
        }
        field(70083; "Bid Charge Code"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Bid Charges Schedule".Code;

            trigger OnValidate()
            begin
                IFSfee.Reset;
                IFSfee.SetRange(Code, "Bid Charge Code");
                if IFSfee.FindSet then begin
                    "Bid Charge (LCY)" := IFSfee.Amount
                end;
            end;
        }
        field(70084; "Bid Charge (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70085; "Payment Reference No."; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70086; "Posted Direct Income Voucher"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70087; "Primary Region"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(70088; "Primary Directorate"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70089; "Primary Department"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"),
                                                                "Direct Reports To" = field("Primary Directorate"));
        }
        field(70090; "Primary Branch/Centre"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Branch));
        }
        field(70091; "Building/House No"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(70092; "Plot No"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70093; Street; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(70094; "Nature of Business"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70095; "Current Trade Licence No"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70096; "Trade Licence Expiry Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70097; "Max Value of Business"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70098; "Preferred Bank Account Code"; Code[20])
        {
            Caption = 'Preferred Bank Account Code';
            DataClassification = CustomerContent;
            TableRelation = "Vendor Bank Account".Code where("Vendor No." = field("Vendor No."));
        }
        field(70099; "Bankers Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70100; "Bankers Branch"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70101; "KNTC Agent"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70102; "Business Type"; Code[30])
        {
            DataClassification = CustomerContent;
            Description = 'Used to record the different Business Types based on Ownership categories such as Companies, Partnerships, Sole Ownership etc. Linked to Business Type Table';
            TableRelation = "Business Types".Code;
        }
        field(70103; "Nominal Capital LCY"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70104; "Issued Capital LCY"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70105; "Response is restricted"; Boolean)
        {
            Caption = 'Response is restricted to invited suppliers';
            DataClassification = CustomerContent;
            Description = 'Response is restricted to invited suppliers';
        }
        field(70106; "Supplier to respond"; Boolean)
        {
            Caption = 'Supplier to respond with full quantity on each line';
            DataClassification = CustomerContent;
            Description = 'Supplier to respond with full quantity on each line';
        }
        field(70107; "Procuring Entity can extend"; Boolean)
        {
            Caption = 'Procuring Entity can extend submission deadline through Addendum';
            DataClassification = CustomerContent;
            Description = 'Procuring Entity can extend submission deadline through Addendum';
        }
        field(70108; "Procuring Entity can Cancel"; Boolean)
        {
            Caption = 'Procuring Entity can Cancel Invitation Notice at any stage';
            DataClassification = CustomerContent;
            Description = 'Procuring Entity can Cancel Invitation Notice at any stage';
        }
        field(70109; "No. of Addendum Notices issued"; Integer)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70110; "Last Addendum Notice No."; Code[20])
        {
            CalcFormula = lookup("Tender Addendum Notice"."Addendum Notice No." where("Invitation Notice No." = field("Invitation For Supply No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70111; "Read-out Bid Price (A)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70112; "Arithmetic Corrections (B)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70113; "Corrected Bid Price (C=A+B)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70114; "Unconditional Discount % (D)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70115; "Unconditional Disc Amount (E)"; Decimal)
        {
            Caption = 'Unconditional Discount Amount (E)';
            DataClassification = CustomerContent;
            Description = 'Unconditional Discount Amount (E)';
        }
        field(70116; "Corrected & Disc Bid Price"; Decimal)
        {
            Caption = 'Corrected & Discounted Bid Price (F=C-E)';
            DataClassification = CustomerContent;
            Description = 'Corrected & Discounted Bid Price (F=C-E)';
        }
        field(70117; "Any Additional Adjustments (G)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70118; "Any Priced Deviations (H))"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70119; "Final Evaluated Bid Price"; Decimal)
        {
            Caption = 'Final Evaluated Bid Price (I=F+G+H)';
            DataClassification = CustomerContent;
            Description = 'Final Evaluated Bid Price (I=F+G+H)';
        }
        field(70120; "Financial Evaluation Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70121; "Weighted Financial Score %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70122; "Financial Evaluation Ranking"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70123; "Pre-bid Register No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "IFS Prebid Register".Code;
        }
        field(70124; "Attended Pre-bid Conference"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70125; "Prebid Conference Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70126; "Bid Opening Register No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70127; "Bid Opening Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70128; "Late Bid (Opening Stage)"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70129; "Withdrawn Bid (Opening Stage)"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70130; "Withdrawal Notice No"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70131; "Modified Bid (Opening Stage)"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70132; "Succesful Bid (Opening Stage)"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70133; "Preliminary Evaluation Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70134; "Responsive Bid (Evaluation)"; Boolean)
        {
            Caption = 'Responsive Bid (Preliminary Evaluation)';
            DataClassification = CustomerContent;
            Description = 'Responsive Bid (Preliminary Evaluation)';
        }
        field(70135; "Technical Evaluation Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70136; "Weighted Tech Score %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70137; "Passed Tech Evaluation"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70138; "Tech Evaluation Ranking"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70139; "Aggregate Weighted Score %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70140; "Aggregate Ranking"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70141; "Final Tender Outcome"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Awarded,Unsuccesful,Canceled,...';
            OptionMembers = ,Awarded,Unsuccesful,Canceled,"...";
        }
        field(70142; "Engineer Estimate (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'This field is based on estimates for Works that usuallly guide bidders/contarctors in specialized industries such as Road construction';
        }
        field(70143; "Max Works Kickoff Duration"; Code[10])
        {
            Caption = 'Max Works Kickoff Duration (After Contract/Order)';
            DataClassification = CustomerContent;
            Description = 'Max Works Kickoff Duration (After Contract/Order)';
        }
        field(70144; "Max Works Charter Duration"; Code[10])
        {
            Caption = 'Max Works Charter/Program Duration (After Contract/Order)';
            DataClassification = CustomerContent;
            Description = 'Max Works Charter/Program Duration (After Contract/Order)';
        }
        field(70145; "Max Works Completion Duration"; Code[10])
        {
            Caption = 'Max Works Completion Duration (After Contract/Order';
            DataClassification = CustomerContent;
            Description = 'Max Works Completion Duration (After Contract/Order';
        }
        field(70147; "Defects Liability Period"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Defects Liability (Warranty) Period';
        }
        field(70148; "Daily Liquidated Dam Unit Cost"; Decimal)
        {
            Caption = 'Daily Liquidated Damages Unit Cost (LCY)';
            DataClassification = CustomerContent;
            Description = 'Daily Liquidated Damages Unit Cost (LCY)';
        }
        field(70149; "Liquidated Damages Limit %"; Decimal)
        {
            Caption = 'Liquidated Damages Limit % (Contract Value)';
            DataClassification = CustomerContent;
            Description = 'Liquidated Damages Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(70150; "Payment Retention %"; Decimal)
        {
            DataClassification = CustomerContent;
            MaxValue = 100;
            MinValue = 0;
        }
        field(70151; "Retention Amount Limit %"; Decimal)
        {
            Caption = 'Retention Amount Limit % (Contract Value)';
            DataClassification = CustomerContent;
            Description = 'Retention Amount Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(70152; "Min Interim Certificate Amount"; Decimal)
        {
            Caption = 'Minimum Interim Certificate Amount (LCY)';
            DataClassification = CustomerContent;
        }
        field(70153; "Vendor No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Vendor."No." where(Blocked = const(" "));

            trigger OnValidate()
            var
                PurchaseCodess: Record "Standard Purchase Code";
                VendorPurchase: Record "Standard Vendor Purchase Code";
                Purchase38: Record "Purchase Header";
            begin

                PurchaseCodess.Reset;
                PurchaseCodess.SetRange(Code, "Invitation For Supply No");
                PurchaseCodess.SetRange("Procurement Method", PurchaseCodess."procurement method"::RFQ);
                if PurchaseCodess.FindSet then begin
                    VendorPurchase.Reset;
                    VendorPurchase.SetRange(Code, "Invitation For Supply No");
                    VendorPurchase.SetRange("Vendor No.", "Vendor No.");
                    if not VendorPurchase.FindFirst then begin
                        Error('ERROR! The selected Supplier was not invited for bidding');
                    end;
                end;
                Purchase38.Reset;
                Purchase38.SetRange("Invitation For Supply No", "Invitation For Supply No");
                Purchase38.SetRange("Document Type", Purchase38."document type"::Quote);
                Purchase38.SetRange("Vendor No.", "Vendor No.");
                if Purchase38.FindFirst then begin
                    Error('ERROR! There already exists a bid response from this vendor/Supplier');
                end;
                "Buy-from Vendor No." := "Vendor No.";
                "Pay-to Vendor No." := "Vendor No.";
                Vendor.Reset;
                Vendor.SetRange("No.", "Vendor No.");
                if Vendor.FindSet then begin
                    //Purch.INIT;
                    //  "Building/House No":=Vendor."Building/House No";
                    //  "Plot No":=Vendor."Plot No";
                    //  Street:=Vendor.Street;
                    //  "Nature of Business":=Vendor."Nature of Business";
                    //  "Current Trade Licence No":=Vendor."Current Trade Licence No";
                    //  "Trade Licence Expiry Date":=Vendor."Trade Licence Expiry Date";
                    //  "Max Value of Business":=Vendor."Max Value of Business";
                    //  "Preferred Bank Account Code":=Vendor."Preferred Bank Account Code";
                    // "Business Type":=Vendor."Business Type";
                    //  "Nominal Capital LCY":=Vendor."Nominal Capital LCY";
                    //  "Issued Capital LCY":=Vendor."Issued Capital LCY";
                    "Buy-from Vendor Name" := Vendor.Name;
                    "Pay-to Name" := Vendor.Name;

                end;

                Procurement.UpdateBidResponse(Rec);
            end;
        }
        field(70154; "Sealed Bids (Technical)"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70155; "Sealed Bids (Financial)"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70156; "Contract Description"; Text[2000])
        {
            DataClassification = CustomerContent;
        }
        field(70157; "Contract Start Date"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Validate("Contract Duration");
            end;
        }
        field(70158; "Contract End Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70159; "Notice of Award No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Bid Tabulation Header" where("Document Type" = filter("Notice of Award"));
        }
        field(70160; "Awarded Bid No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Quote));
        }
        field(70161; "Award Tender Sum Inc Taxes"; Decimal)
        {
            Caption = 'Award Tender Sum Inc Taxes (LCY)';
            DataClassification = CustomerContent;
            Description = 'Award Tender Sum Inc Taxes (LCY)';
        }
        field(70162; "IFS Code"; Code[40])
        {
            DataClassification = CustomerContent;
            TableRelation = "Standard Purchase Code".Code;
            //TestTableRelation = false;

            trigger OnValidate()
            begin
                IFS.Reset();
                IFS.SetRange(code, rec."IFS Code");
                if ifs.FindFirst() then
                    "Tender Name" := IFS.Description;
            end;
        }
        field(70163; "Tender Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(70164; "Contract Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Original Contract,Contract Variation';
            OptionMembers = "Original Contract","Contract Variation";
        }
        field(70165; "Parent Contract ID"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70166; "Governing Laws"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Law & Regulation";
        }
        field(70167; "Contract Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Signed,Terminated,Expired,Closed,Ongoing';
            OptionMembers = Signed,Cancelled,Expired,Closed,Ongoing;
            Editable = false;
        }
        field(70168; "Procuring Entity (PE) Name"; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(70169; "PE Representative"; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(70170; "Final Evaluation Report"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70171; "Final Evaluation Report Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70172; "Proffesion Opinion No"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70173; "Proffesion Opinion Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70174; "Due Dilgence Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70175; "Due Diligence Rating"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Due Diligence Assessment Rating';
        }
        field(70176; "Due Diligence Report ID"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(70177; "Due Diligence Voucher"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70178; "Reason For ammendment"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70180; "Previous Contract No"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Blanket Order"));

            trigger OnValidate()
            var
                PurchaseHeaderPreContract: Record "Purchase Header";
            begin
                PurchaseHeaderPreContract.Reset;
                PurchaseHeaderPreContract.SetRange("No.", "Previous Contract No");
                if PurchaseHeaderPreContract.FindSet then begin
                    "Contract Description" := PurchaseHeaderPreContract."Contract Description";
                    "Contract Duration" := PurchaseHeaderPreContract."Contract Duration";
                    "Contract No." := PurchaseHeaderPreContract."Contract No.";
                    "Contract Name" := PurchaseHeaderPreContract."Contract Name";
                    "Contract Start Date" := PurchaseHeaderPreContract."Contract Start Date";
                    "Contract End Date" := PurchaseHeaderPreContract."Contract End Date";
                    "Contract Duration" := PurchaseHeaderPreContract."Contract Duration";
                    "Pay-to Vendor No." := PurchaseHeaderPreContract."Vendor No.";
                    Validate("Vendor No.");
                end;
            end;
        }
        field(70216; "Expected Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70181; "Perforamance Sec. Expiry Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70182; "Advance Payment Amount(LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'Advance Payment Amount(LCY)';
        }
        field(70183; "Advance Payment Settled"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70184; "Certificate Number"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70185; "Advance Recovery %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70186; "Retention %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70187; "Total Invoiced"; Decimal)
        {
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Document Type" = filter(Invoice),
                                                                           "Vendor No." = field("Buy-from Vendor No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70188; Balance; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70189; "Project No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Job."No.";
        }
        field(70190; "Multiple IFS"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70191; "Date Required"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70192; "Store Issue No"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(70193; "Posted By"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70194; "Late Bid Submission Time"; Time)
        {
            DataClassification = CustomerContent;
            Description = 'This field is only completed for bids marked as LATE.';
        }
        field(70195; "Bid No"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(70196; "Preliminary Evaluation Voucher"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70197; "Preliminary Evaluation Verdict"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Responsive,Non Responsive';
            OptionMembers = ,Responsive,"Non Responsive";
        }
        field(70198; "Techn Evaluation Voucher"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70199; "Technical Evaluation Verdict"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(70200; "Remarks(Preliminary)"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70201; "Remarks(Technical)"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70202; "Framework Agreement No"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70203; "Contract Period"; Duration)
        {
            DataClassification = CustomerContent;
        }
        field(70204; "LPO Sent"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70205; "Archived By"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70206; "Archived On"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(70207; "Last Printed By"; Code[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70208; "Consolidate to IFS No."; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Standard Purchase Code".Code where(Status = const(Open),
                                                                 "Procurement Method" = field("PP Procurement Method"));

            trigger OnValidate()
            begin
                TestField("Consolidate PRN", true);
            end;
        }
        field(70209; "Consolidate PRN"; Boolean)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if ("Document Type" = "document type"::"Purchase Requisition") then begin
                    if xRec."Consolidate PRN" = false then begin
                        if not Confirm('Are you sure you want to mark this requisition for Consolidation ?', true) then begin
                            "Consolidate PRN" := false;
                        end;
                    end;
                end;
            end;
        }
        field(70210; "Period of Contract"; DateFormula)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Contract Start Date" <> 0D then
                    "Contract End Date" := CalcDate("Period of Contract", "Contract Start Date");
            end;
        }
        field(70211; "Remarks(Financial)"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70212; "LPO Cancelled"; Boolean)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70213; "LPO Cancelled By"; Text[50])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70214; "LPO Cancelled On"; DateTime)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70215; "Reason For Cancelling LPO"; Text[500])
        {
            DataClassification = CustomerContent;
        }
        field(90216; "Other Procurement Methods"; Text[100])
        {
            Caption = 'Alternative Procurement Methods';

        }
        field(8603700; Test; Code[5])
        {
            DataClassification = CustomerContent;
        }
        field(8603701; "Procurement Plan Item Descript"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(8603702; "Item Category Description"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(8603703; "Has Attachment"; Boolean)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(8603704; "Contract Duration"; DateFormula)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Contract Start Date" <> 0D then
                    "Contract End Date" := CalcDate("Contract Duration", "Contract Start Date")
            end;
        }
        field(8603705; Type; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ",Goods,Services,Consultancy,Works;
        }
        field(8603706; Location; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(8603707; "Area Space"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(8603708; "Payment Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Paid,Not Paid';
            OptionMembers = " ",Paid,"Not Paid";
        }
        field(8603709; Institution; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(8603710; "Serial No."; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(8603711; Renewed; Boolean)
        {
            DataClassification = CustomerContent;
            Description = 'Renewed';
        }
        field(8603712; "Renewed Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(8603713; "Party Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(8603714; "Vendor Party"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Broker,Consultant,Service Provider,Supplier';
            OptionMembers = " ",Broker,Consultant,"Service Provider",Supplier;
        }
        field(8603715; "Company Head"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,CEO,Managing Director,General Manager';
            OptionMembers = " ",CEO,"Managing Director","General Manager";
        }
        field(8603716; "Vendor Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(8603717; "Mou Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(8603718; "Scope of Service"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,By Kasneb,By Vendor';
            OptionMembers = " ","By Kasneb","By Vendor";
        }
        field(8603719; "Scope Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(8603720; "Replacement Date"; Date)
        {
            Caption = 'Replacement Date';
        }
        field(8603721; Mileage; Decimal)
        {
            Caption = 'Mileage';
        }
        field(8603722; "Reg No."; Code[20])
        {
            Caption = 'Reg No.';
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            var
                FleetVehicle: Record "Fleet Vehicles.";

            begin
                FleetVehicle.Reset;
                FleetVehicle.SetRange("Registration No.", "Reg No.");

                if FleetVehicle.FindFirst() then begin

                    Make := FleetVehicle.Description;
                end
            end;
        }
        field(8603723; Make; Code[50])
        {
            Caption = 'Make/Model';
            Editable = false;
        }
        field(8603724; "Source RecordID"; RecordId)
        {
            Editable = false;
        }
        field(8603725; "Assigned Officer"; text[150])
        {
            Editable = false;
        }
        field(8603726; "Notified"; Boolean)
        {
            Editable = false;
        }
        field(8603727; "Purchaser Code2"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser" where("Global Dimension 1 Code" = field("Shortcut Dimension 1 Code"));
            trigger OnValidate()
            var
                myInt: Integer;
                //SalesPerson: record Employee;
                SalesPerson: record "User Setup";
            begin
                SalesPerson.reset;
                //SalesPerson.setrange(SalesPerson."No.", rec."Purchaser Code");
                SalesPerson.setrange(SalesPerson."Employee No.", rec."Purchaser Code2");
                if SalesPerson.findfirst then begin
                    //rec."Assigned Officer" := SalesPerson."full name";
                    Rec."Assigned Officer" := SalesPerson."Employee Name";
                    Rec."Assigned User ID" := SalesPerson."User ID";
                end else
                    // Optionally handle the case where no salesperson is found
                    Rec."Assigned Officer" := '';
            end;
        }
        field(8603728; "Supplier Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(8603729; "Bid Bond"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8603730; "No. of Pages Submitted"; integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(KeyExt1; "Source RecordID")
        {
        }
        Key(KeyExt2; "Source RecordID", "Plot No")
        {
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    InitInsert;

    IF GETFILTER("Buy-from Vendor No.") <> '' THEN
    #4..8

    IF "Buy-from Vendor No." <> '' THEN
      StandardCodesMgt.CheckShowPurchRecurringLinesNotification(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
    IF UsersRec.GET(USERID) THEN BEGIN
      IF  UsersRec."Portal User" = FALSE THEN BEGIN //exempt the portal user name
      "Requester ID":=USERID;
       "Request-By Name":=UsersRec."Employee Name";
       "Request-By No.":=UsersRec."Employee No.";
       "Responsibility Center":=UsersRec."Purchase Resp. Ctr. Filter";
       "Shortcut Dimension 1 Code":= UsersRec."Region Code";
       //MESSAGE("Shortcut Dimension 1 Code");
       //VALIDATE("Shortcut Dimension 1 Code");

       END;
       END;
    //added on 28/06/2019 to add HOD
    Empl.RESET;
    Empl.SETRANGE("No.","Request-By No.");
    IF Empl.FIND('-') THEN BEGIN
      HOD := Empl.HOD;
      "Directorate Code1":=Empl."Directorate Code";
      "Department Code":=Empl."Department Code";
     // "Shortcut Dimension 1 Code":=Empl."Global Dimension 1 Code";
      Division:=Empl.Division;
      "Shortcut Dimension 1 Code":=Empl."Global Dimension 1 Code";
      "Shortcut Dimension 2 Code":=Empl."Global Dimension 2 Code";
      VALIDATE("Shortcut Dimension 1 Code");
      VALIDATE("Shortcut Dimension 2 Code");

    END;
    //
    IF "Document Type"="Document Type"::"Purchase Requisition" THEN BEGIN
      "Assigned User ID":='';
        END;
    "Order Date":=TODAY;
    //Add Default procurement plan
    AnnualReportingCodes.RESET;
    AnnualReportingCodes.SETRANGE("Current Year",TRUE);
    IF AnnualReportingCodes.FINDSET THEN
     "Procurement Plan":=AnnualReportingCodes."Annual Procurement Plan";
    "Taken By":=PurchLine."Employee Name";

    //update defaults for IFS

    IF "Document Type"="Document Type"::"Purchase Requisition" THEN BEGIN
      ProcSetup.GET;
      "PRN Conversion Procedure":=ProcSetup."Default PRN Conversion Proc";
      END;
    */
    //end;


    //Unsupported feature: Code Modification on "GetNoSeriesCode(PROCEDURE 9)".

    //procedure GetNoSeriesCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CASE "Document Type" OF
      "Document Type"::Quote:
        NoSeriesCode := PurchSetup."Quote Nos.";
    #4..10
        NoSeriesCode := PurchSetup."Credit Memo Nos.";
      "Document Type"::"Blanket Order":
        NoSeriesCode := PurchSetup."Blanket Order Nos.";
    END;
    OnAfterGetNoSeriesCode(Rec,PurchSetup,NoSeriesCode);
    EXIT(NoSeriesMgt.GetNoSeriesWithCheck(NoSeriesCode,SelectNoSeriesAllowed,"No. Series"));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..13
      "Document Type"::"Purchase Requisition":
        NoSeriesCode := PurchSetup."Purchase Requisition Nos.";
       "Document Type"::"Store Requisition":
        NoSeriesCode := PurchSetup."Store Requisition Nos.";
       "Document Type"::MOU:
        NoSeriesCode := PurchSetup."MOU Nos.";
    #14..16
    */
    //end;


    //Unsupported feature: Code Modification on "ValidateShortcutDimCode(PROCEDURE 19)".

    //procedure ValidateShortcutDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OldDimSetID := "Dimension Set ID";
    DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
    IF "No." <> '' THEN
      MODIFY;

    IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
      MODIFY;
      IF PurchLinesExist THEN
        UpdateAllLineDim("Dimension Set ID",OldDimSetID);
    END;

    OnAfterValidateShortcutDimCode(Rec,xRec,FieldNumber,ShortcutDimCode);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
      //MODIFY;

    IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
      //MODIFY;
    #8..12
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateShipToAddress(PROCEDURE 21)".

    //procedure UpdateShipToAddress();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF IsCreditDocType THEN BEGIN
      OnAfterUpdateShipToAddress(Rec);
      EXIT;
    END;
    #5..20
    END;

    OnAfterUpdateShipToAddress(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {IF IsCreditDocType THEN BEGIN
    #2..23
    }
    */
    //end;


    //Unsupported feature: Code Modification on "SetShipToForSpecOrder(PROCEDURE 23)".

    //procedure SetShipToForSpecOrder();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF Location.GET("Location Code") THEN BEGIN
      "Ship-to Code" := '';
      SetShipToAddress(
        Location.Name,Location."Name 2",Location.Address,Location."Address 2",
        Location.City,Location."Post Code",Location.County,Location."Country/Region Code");
      "Ship-to Contact" := Location.Contact;
      "Location Code" := Location.Code;
    END ELSE BEGIN
      CompanyInfo.GET;
      "Ship-to Code" := '';
    #11..16
    END;

    OnAfterSetShipToForSpecOrder(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {IF Location.GET("Location Code") THEN BEGIN
    #2..7
      }{
    #8..19
    }
    */
    //end;
    trigger OnBeforeInsert()
    var
        myInt: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PurchSetup: Record "Procurement Setup";
        PurchSetup2: Record "Procurement Setup";
    begin
        if rec."Document Type" = rec."Document Type"::"Purchase Requisition" then begin
            if rec."No." = '' then begin

                PurchSetup.GET;
                PurchSetup.TESTFIELD("Purchase Req No");
                NoSeriesMgt.InitSeries(PurchSetup."Purchase Req No", xRec."No.", 0D, rec."No.", "No. Series");

            end;

        end;
        if rec."Document Type" = rec."Document Type"::"Store Requisition" then begin
            if rec."No." = '' then begin

                PurchSetup.GET;
                PurchSetup.TESTFIELD("Store Req No");
                NoSeriesMgt.InitSeries(PurchSetup."Store Req No", xRec."No.", 0D, rec."No.", "No. Series");
            end;

        end;
        UsersRec.Reset();
        UsersRec.SetRange("User ID", UserId);
        // UsersRec.SetRange("Portal User", false);
        if UsersRec.FindFirst() then begin
            "Requester ID" := UserId;
            "Request-By Name" := UsersRec."Employee Name";
            "Request-By No." := UsersRec."Employee No.";
            // validate("Request-By No.");
            "Responsibility Center" := UsersRec."Purchase Resp. Ctr. Filter";

            //"Location Code" := Empl."Global Dimension 1 Code";
            //"Shortcut Dimension 1 Code" := UsersRec."Region Code";


        end;
        PurchSetup2.GET;
        Rec."Procurement Plan ID" := PurchSetup2."Default Procurement Plan";
        Empl.Reset();
        Empl.setrange("No.", "Request-By No.");

        if Empl.findset() then begin
            //"Request-By Name" := Empl.FullName;
            "Shortcut Dimension 1 Code" := Empl."Global Dimension 1 Code";
            "Shortcut Dimension 2 Code" := Empl."Global Dimension 2 Code";
            //message('%1,%2', "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        end;
        //added on 28/06/2019 to add HOD
        // Empl.RESET;
        // Empl.SETRANGE("No.", "Request-By No.");
        // IF Empl.FIND('-') THEN BEGIN
        //     HOD := Empl.HOD;
        //     "Directorate Code1" := Empl."Directorate Code";
        //     "Department Code" := Empl."Department Code";
        //     // "Shortcut Dimension 1 Code":=Empl."Global Dimension 1 Code";
        //     Division := Empl.Division;
        //     "Shortcut Dimension 1 Code" := Empl."Global Dimension 1 Code";
        //     "Shortcut Dimension 2 Code" := Empl."Global Dimension 2 Code";
        //     VALIDATE("Shortcut Dimension 1 Code");
        //     VALIDATE("Shortcut Dimension 2 Code");

        // END;
    end;

    local procedure "........procurement Functions............"()
    begin
    end;

    procedure CreateBidRegister()
    var
        myInt: Integer;
        BidRegister: record "Bid Opening Register";
        NoSeriesMgt: codeunit NoSeriesManagement;
        ProcurementSetup: record "Procurement Setup";
        DocNo: code[40];
    begin
        BidRegister.Reset();
        BidRegister.init;
        DocNo := NoSeriesMgt.GetNextNo(ProcurementSetup."Bid Opening Nos", 0D, true);
        BidRegister.code := DocNo;
        BidRegister."IFS Code" := rec."No.";
        BidRegister.Validate(BidRegister."IFS Code");
        BidRegister.insert;
    end;

    procedure CreatePurchaseOrderProcMethodLines(var ProcReqLines: Record "Purchase Line")
    var
        PurchaseRec: Record "Purchase Header";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchaseRecLine: Record "Purchase Line";
        ProcReq: Record "Procurement Request";
        ProcReq1: Record "Procurement Request";
        ProcReqLines1: Record "Procurement Request Lines";
        ProcReqLines2: Record "Procurement Request Lines";
        Recordsupdated: Integer;
        GLSETUP: Record "General Ledger Setup";
    begin

        with ProcReqLines do begin

            ProcReqLines2.Reset;
            ProcReqLines2.SetRange("Requisition No", ProcReqLines."Requisition No");
            ProcReqLines2.SetRange(Select, true);
            ProcReqLines2.SetRange(Ordered, false);
            ProcReqLines2.SetRange("Vendor No", ProcReqLines."Buy-from Vendor No.");
            if ProcReqLines2.Find('-') then begin

                //Purchase Header
                PurchaseHeader.Init;
                PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
                PurchaseHeader."No." := '';
                PurchaseHeader."Buy-from Vendor No." := ProcReqLines2."Vendor No";
                PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
                // if Vend.Get(ProcReqLines2."Vendor No") then
                // PurchaseHeader."Supplier Type":=Vend."Special Groups Type";

                ProcReq.Reset;
                ProcReq.SetRange(ProcReq.No, ProcReqLines2."Requisition No");
                if ProcReq.Find('-') then
                    PurchaseHeader."Requisition No" := ProcReq."Requisition No";
                //IF NOT PurchaseHeader.GET(PurchaseHeader."No.") THEN
                PurchaseHeader.Insert(true);


                repeat
                    //Purchase Lines
                    PurchaseLine.Reset;
                    PurchaseLine.SetRange(PurchaseLine."Document Type", PurchaseLine."document type"::Order);
                    PurchaseLine.SetRange(PurchaseLine."Document No.", PurchaseHeader."No.");
                    PurchaseLine.SetRange(PurchaseLine."Line No.", ProcReqLines2."Line No");
                    PurchaseLine.SetRange(PurchaseLine."Buy-from Vendor No.", ProcReqLines2."Vendor No");
                    if not PurchaseLine.FindFirst then begin
                        PurchaseLine.Init;
                        PurchaseLine."Document Type" := PurchaseLine."document type"::Order;
                        PurchaseLine."Document No." := PurchaseHeader."No.";
                        PurchaseLine."Line No." := ProcReqLines2."Line No";//PurchaseLine.VALIDATE(PurchaseLine."No.");
                        PurchaseLine."Buy-from Vendor No." := ProcReqLines2."Vendor No";

                        if ProcReqLines.Type = ProcReqLines2.Type::"Non Stock Item" then
                            PurchaseLine.Type := PurchaseLine.Type::"G/L Account";
                        if ProcReqLines.Type = ProcReqLines2.Type::"Fixed Asset" then
                            PurchaseLine.Type := PurchaseLine.Type::"Fixed Asset";
                        if ProcReqLines.Type = ProcReqLines2.Type::Item then
                            PurchaseLine.Type := PurchaseLine.Type::Item;

                        PurchaseLine."No." := ProcReqLines2.No;
                        PurchaseLine.Description := ProcReqLines2.Description;
                        PurchaseLine."Unit of Measure" := ProcReqLines2."Unit of Measure";
                        PurchaseLine.Quantity := ProcReqLines2.Quantity;
                        PurchaseLine."Direct Unit Cost" := ProcReqLines2."Unit Price";
                        PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");
                        PurchaseLine."Approved Requisition Amount" := ProcReqLines2."Unit Price";
                        //PurchaseLine."Location Code":=PurchaseRecLine."Location Code";
                        if not PurchaseLine.Get(PurchaseLine."document type"::Order, PurchaseHeader."No.", ProcReqLines2."Line No") then
                            PurchaseLine.Insert(true);
                    end;
                    //UNTIL ProcReqLines.NEXT = 0;
                    //CODEUNIT.RUN(CODEUNIT::"Purch.-Quote to Order",PurchaseHeader);


                    //Update the Proc Request
                    /*ProcReqLines.RESET;
                    ProcReqLines.SETRANGE("Requisition No",ProcReqLines."Requisition No");
                    ProcReqLines.SETRANGE(Ordered,FALSE);
                    ProcReqLines.SETRANGE(Select,TRUE);
                    IF ProcReqLines.FIND('-') THEN BEGIN
                    REPEAT*/
                    ProcReqLines2.Ordered := true;
                    ProcReqLines2."Order Date" := Today;
                    ProcReqLines2.Modify;
                /*UNTIL ProcReqLines.NEXT =0;
                END;*/

                //END;
                until ProcReqLines2.Next = 0;

                Message(Text001, PurchaseHeader."No.");
            end;//****ProcReqLines2

            //Update Header Fully ordered*****
            Recordsupdated := 0;
            //Update Header Fully ordered
            ProcReqLines1.Reset;
            ProcReqLines1.SetRange("Requisition No", ProcReqLines."Requisition No");
            ProcReqLines1.SetRange(Ordered, false);
            ProcReqLines1.SetRange(Select, true);
            if ProcReqLines1.Find('-') then begin
                repeat
                    Recordsupdated := Recordsupdated + 1;
                until ProcReqLines1.Next = 0;
            end;
            if Recordsupdated = 0 then begin
                ProcReq.Closed := true;
                //ProcReq.Status:=ProcReq.Status::"Pending Approval";
                ProcReq.Modify;

                //Update Purch Req
                ProcReq.Reset;
                ProcReq.SetRange(ProcReq.No, ProcReqLines."Requisition No");
                if ProcReq.Find('-') then
                    if PurchaseRec.Get(ProcReq."Requisition No") then begin
                        PurchaseRec.Ordered := true;
                        PurchaseRec.Modify;
                    end;


            end;
            //Update Header Fully ordered*****


        end;

    end;

    procedure CreatePurchaseOrderProcMethod(var ProcReq: Record "Procurement Request")
    var
        PurchaseRec: Record "Purchase Header";
        PurchaseHeader: Record "Purchase Header";
        ProcReqLines: Record "Procurement Request Lines";
        PurchaseLine: Record "Purchase Line";
    begin

        with ProcReq do begin

            //Purchase Header
            PurchaseHeader.Init;
            PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
            PurchaseHeader."No." := '';
            PurchaseHeader."Buy-from Vendor No." := ProcReq."Vendor No";
            PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
            // Vend.Reset;
            // Vend.SetRange("No.",ProcReq."Vendor No");
            // if Vend.FindSet then
            // PurchaseHeader."Supplier Type":=Vend."Special Groups Type";
            PurchaseHeader."Requisition No" := ProcReq."Requisition No";
            PurchaseHeader."Posting Date" := Today;
            PurchaseHeader."Due Date" := Today;
            PurchaseHeader.Validate(PurchaseHeader."Posting Date");
            PurchaseHeader."Document Date" := Today;
            PurchaseHeader.Validate(PurchaseHeader."Document Date");
            //IF NOT PurchaseHeader.GET(PurchaseHeader."No.") THEN
            PurchaseHeader.Insert(true);


            ProcReqLines.Reset;
            ProcReqLines.SetRange("Requisition No", ProcReq.No);
            if ProcReqLines.Find('-') then begin
                repeat
                    //Purchase Lines
                    PurchaseLine.Reset;
                    PurchaseLine.SetRange(PurchaseLine."Document Type", PurchaseLine."document type"::Order);
                    PurchaseLine.SetRange(PurchaseLine."Document No.", PurchaseHeader."No.");
                    PurchaseLine.SetRange(PurchaseLine."Line No.", ProcReqLines."Line No");
                    PurchaseLine.SetRange(PurchaseLine."Buy-from Vendor No.", ProcReq."Vendor No");
                    if not PurchaseLine.FindFirst then begin
                        PurchaseLine.Init;
                        PurchaseLine."Document Type" := PurchaseLine."document type"::Order;
                        PurchaseLine."Document No." := PurchaseHeader."No.";
                        PurchaseLine."Line No." := ProcReqLines."Line No";//PurchaseLine.VALIDATE(PurchaseLine."No.");
                        PurchaseLine."Buy-from Vendor No." := ProcReq."Vendor No";
                        //PurchaseLine.Type:=ProcReqLines.Type;

                        if ProcReqLines.Type = ProcReqLines.Type::"Non Stock Item" then
                            PurchaseLine.Type := PurchaseLine.Type::"G/L Account";
                        if ProcReqLines.Type = ProcReqLines.Type::"Fixed Asset" then
                            PurchaseLine.Type := PurchaseLine.Type::"Fixed Asset";
                        if ProcReqLines.Type = ProcReqLines.Type::Item then begin
                            PurchaseLine.Type := PurchaseLine.Type::Item;
                        end;
                        PurchaseLine."No." := ProcReqLines.No;
                        PurchaseLine.Validate(PurchaseLine."No.");
                        PurchaseLine."Activity Type" := ProcReqLines."Activity Type";
                        PurchaseLine.Activity := ProcReqLines.Activity;
                        PurchaseLine."Current Budget" := ProcReqLines."Current Budget";
                        PurchaseLine.Description := ProcReqLines.Description;
                        PurchaseLine."Unit of Measure" := ProcReqLines."Unit of Measure";
                        PurchaseLine.Quantity := ProcReqLines.Quantity;
                        ProcReqLines.TestField(ProcReqLines."Unit Price");
                        PurchaseLine."Direct Unit Cost" := ProcReqLines."Unit Price";
                        PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");
                        //PurchaseLine."Location Code":=PurchaseRecLine."Location Code";
                        // PurchLine.Amount:=PurchaseLine.Quantity* PurchaseLine."Direct Unit Cost";
                        // PurchLine."Approved Requisition Amount":=ProcReqLines."Unit Price";
                        PurchaseLine.Validate(Quantity);
                        PurchaseLine."Direct Unit Cost" := ProcReqLines."Unit Price";
                        //IF NOT PurchaseLine.GET(PurchaseLine."Document Type"::Order,PurchaseHeader."No.",ProcReqLines."Line No.") THEN
                        PurchaseLine.Insert(true);
                    end;
                until ProcReqLines.Next = 0;
                //CODEUNIT.RUN(CODEUNIT::"Purch.-Quote to Order",PurchaseHeader);
            end;

            Message(Text001, PurchaseHeader."No.");
            PurchaseRec.Reset;
            PurchaseRec.SetRange("No.", ProcReq."Requisition No");
            if PurchaseRec.FindSet then begin
                //IF PurchaseRec.GET(ProcReq."Requisition No") THEN BEGIN
                PurchaseRec.Ordered := true;
                PurchaseRec.Modify;
            end;

            //Update the Proc Request
            ProcReq.Closed := true;
            //ProcReq.Status:=ProcReq.Status::"Pending Approval";
            ProcReq.Modify;


        end;
    end;

    // [IntegrationEvent(false, false)]
    // procedure OnAfterStatusChange(PurchaseHeader: Record "Purchase Header")
    // begin
    // end;

    var
        PurchaseHeader1: Record "Purchase Header";

    var
        Commitment: Codeunit "Procurement Processing";

    var
        Text0057: label 'Please Select the Supplier';
        Text0058: label 'Purchase Order No %1 has been created';
        Text0059: label 'Process Type %1,  cannot be used when the Amount is above the set limit of %2';
        Text0060: label 'Process Type %1,  cannot be used when the Amount is less than the minimum the set limit of %2';
        Text0061: label 'Are you sure you want to select Process Type as %1 ?';
        ProcCeiling: Record "Procurement Financial ceilings";
        RequisitionHeader: Record "Purchase Header";
        RequisitionLines: Record "Purchase Line";
        RFQLines: Record "Procurement Request Lines";
        VATPostingSetup: Record "VAT Posting Setup";
        UsersRec: Record "User Setup";
        Empl: Record Employee;
        /// "...procurement....": ;
        Text001: label 'Purchase Order No %1 has been created';
        AnnualReportingCodes: Record "Annual Reporting Codes";
        PlanItem: Record "Procurement Plan1";
        ItemCategory: Record "Item Category";
        PPlanEntry: Record "Procurement Plan Entry";
        ProcSetup: Record "Procurement Setup";
        // WorksCategory: Record "Works Category";
        // EmailNotification: Codeunit "Email Notifications";
        IFSfee: Record "Bid Charges Schedule";
        // DetailsOfRoadActivities: Record "Details Of Road Activities";
        Procurement: Codeunit "Procurement Processing";
        JobPlanningLine: Record "Job Planning Line";
        JobTask: Record "Job Task";
        JobS: Record Job;
        IFS: Record "Standard Purchase Code";
        IFSLines: Record "Standard Purchase Line";
        PurchLines: Record "Purchase Line";
        Vendor: Record Vendor;
        FixedAsset: Record "Fixed Asset";
        SoliType: Record "Solicitation Type";
        UserSetup: Record "User Setup";

    local procedure PostStoreReqLines()
    var
        ItemJnlTemplate: Record "Item Journal Template";
        ItemJnlBatch: Record "Item Journal Batch";
        ItemJnlLine: Record "Item Journal Line";
        StoreReqHeader: Record "Purchase Header";
        StoreReqLine: Record "Purchase Line";
        ItemGnl: Record "Item Journal Line";
        RequisitionLine: Record "Purchase Line";
        Linenumber: Integer;
        JobJnlBatch: Record "Job Journal Template";
        JobJnlLine: Record "Job Journal Line";
        StoreLedgers: Record "Store Requisition Notes";
        entryNo: Integer;
    begin
        if Rec."Requisition Type" = Rec."requisition type"::"Stock Replenishment" then
            Error('YOU CANNOT ISSUE A STOCK REPLENISHMENT IR.PLEASE CHECK!!');

        if Rec."Requisition Type" = Rec."requisition type"::Project then begin
            //TESTFIELD("Taken By");
            Rec.TestField("Posting Date");
            //if


            JobJnlLine.Reset;
            JobJnlLine.SetRange(JobJnlLine."Journal Template Name", 'JOB');
            JobJnlLine.SetRange(JobJnlLine."Journal Batch Name", 'SREQ');
            JobJnlLine.DeleteAll(true);

            JobJnlLine.Reset;
            JobJnlLine.SetRange(JobJnlLine."Journal Template Name", 'JOB');
            JobJnlLine.SetRange(JobJnlLine."Journal Batch Name", 'SREQ');
            if JobJnlLine.FindLast then
                Linenumber := ItemGnl."Line No."
            else
                Linenumber := 10000;

            RequisitionLine.Reset;

            RequisitionLine.SetRange(RequisitionLine."Document No.", Rec."No.");
            RequisitionLine.SetRange(RequisitionLine."Document Type", Rec."Document Type");
            RequisitionLine.SetRange(RequisitionLine.Type, RequisitionLine.Type::Item);

            RequisitionLine.SetRange(RequisitionLine.Select, true);
            //RequisitionLine.SETRANGE(RequisitionLine."HOD Action",RequisitionLine."HOD Action"::Approved);
            //RequisitionLine.GET(RequisitionLine."Journal Batch Name");
            if RequisitionLine.Find('-') then begin
                repeat
                    //MESSAGE('RERE');
                    //MESSAGE("Requisition No.");

                    if RequisitionLine."Quantity To  Issue" = 0 then
                        Error('YOU CANNOT ISSUE ZERO QUANTITIES.PLEASE CHECK!!');


                    JobJnlLine.Init;

                    JobJnlLine."Journal Template Name" := 'JOB';
                    JobJnlLine."Journal Batch Name" := 'SREQ';
                    JobJnlLine."Line No." := Linenumber;
                    //ItemGnl."Quantity Requested":=RequisitionLine.Quantity;
                    //ItemGnl."Posting Date":=20070201D;
                    //ItemGnl."Posting Date":=RequisitionLine."Order Date";
                    JobJnlLine."Posting Date" := Rec."Posting Date";
                    JobJnlLine.Validate(JobJnlLine."Posting Date");
                    JobJnlLine."Document No." := Rec."No.";
                    JobJnlLine.Validate("Document No.");
                    JobJnlLine."Job No." := RequisitionLine."Job No.";
                    JobJnlLine.Validate(JobJnlLine."Job No.");
                    JobJnlLine."Job Task No." := RequisitionLine."Job Task No.";
                    JobJnlLine.Validate(JobJnlLine."Job Task No.");
                    JobJnlLine.Type := JobJnlLine.Type::Item;
                    JobJnlLine.Validate(JobJnlLine.Type);
                    JobJnlLine."No." := RequisitionLine."No.";
                    JobJnlLine.Validate(JobJnlLine."No.");
                    JobJnlLine.Description := RequisitionLine.Description;

                    JobJnlLine."Location Code" := RequisitionLine."Location Code";
                    JobJnlLine.Validate(JobJnlLine."Location Code");
                    JobJnlLine.Quantity := RequisitionLine."Quantity To  Issue";
                    JobJnlLine.Validate(JobJnlLine.Quantity);
                    JobJnlLine."Unit of Measure Code" := RequisitionLine."Unit of Measure";

                    JobJnlLine.Validate(JobJnlLine."Unit of Measure Code");
                    JobJnlLine."Unit Cost" := RequisitionLine."Direct Unit Cost";
                    JobJnlLine."Total Cost" := RequisitionLine."Line Amount";
                    JobJnlLine."Gen. Prod. Posting Group" := RequisitionLine."Gen. Prod. Posting Group";
                    JobJnlLine."Gen. Bus. Posting Group" := RequisitionLine."Gen. Bus. Posting Group";
                    //MESSAGE('%1',RequisitionLine."Dimension Set ID");
                    //JobJnlLine."Dimension Set ID":=RequisitionLine."Dimension Set ID";
                    //JobJnlLine.VALIDATE(JobJnlLine."Dimension Set ID");
                    JobJnlLine.Insert(true);

                    JobJnlLine."Dimension Set ID" := RequisitionLine."Dimension Set ID";
                    //JobJnlLine.VALIDATE(JobJnlLine."Dimension Set ID");
                    JobJnlLine.Modify(true);
                    Linenumber := Linenumber + 10000;
                until RequisitionLine.Next = 0;


                //post journal.
                JobJnlLine.Reset;
                JobJnlLine.SetRange(JobJnlLine."Journal Template Name", 'JOB');
                JobJnlLine.SetRange(JobJnlLine."Journal Batch Name", 'SREQ');
                //ItemGnl.SETRANGE(ItemGnl."Document No.","Requisition No.");
                Codeunit.Run(Codeunit::"Job Jnl.-Post", JobJnlLine);



                //END ELSE BEGIN
                //ERROR('YOU HAVE NOT SELECTED ANY LINE.PLEASE CHECK!!');
            end;


        end else begin

            //TESTFIELD("Taken By");
            Rec.TestField("Posting Date");
            //if
            ItemGnl.Reset;
            ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
            ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
            ItemGnl.DeleteAll(true);


            ItemGnl.Reset;
            ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
            ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
            if ItemGnl.FindLast then
                Linenumber := ItemGnl."Line No."
            else
                Linenumber := 10000;
            //MESSAGE('%1',Linenumber);

            RequisitionLine.Reset;

            RequisitionLine.SetRange(RequisitionLine."Document No.", Rec."No.");
            RequisitionLine.SetRange(RequisitionLine."Document Type", Rec."Document Type");
            RequisitionLine.SetRange(RequisitionLine.Type, RequisitionLine.Type::Item);

            // RequisitionLine.SetRange(RequisitionLine.Select, true);
            //RequisitionLine.SETRANGE(RequisitionLine."HOD Action",RequisitionLine."HOD Action"::Approved);
            //RequisitionLine.GET(RequisitionLine."Journal Batch Name");
            if RequisitionLine.Find('-') then begin
                repeat
                    //MESSAGE('RERE');
                    //MESSAGE("No.");

                    if RequisitionLine."Quantity To  Issue" = 0 then
                        Error('YOU CANNOT ISSUE ZERO QUANTITIES.PLEASE CHECK!!');

                    ItemGnl.Init;

                    ItemGnl."Journal Template Name" := 'ITEM';
                    ItemGnl."Journal Batch Name" := 'REQ';
                    ItemGnl."Document No." := Rec."No.";
                    //ItemGnl."Quantity Requested":=RequisitionLine.Quantity;
                    //ItemGnl."Posting Date":=20070201D;
                    //ItemGnl."Posting Date":=RequisitionLine."Order Date";
                    ItemGnl."Posting Date" := Rec."Posting Date";
                    ItemGnl."Entry Type" := ItemGnl."entry type"::"Negative Adjmt.";
                    ItemGnl."Item No." := RequisitionLine."No.";
                    ItemGnl.Validate("Item No.");
                    ItemGnl.Description := 'Items issued to:' + Rec."Request-By Name";
                    ItemGnl."Job No." := RequisitionLine."Job No.";
                    ItemGnl."Location Code" := RequisitionLine."Location Code";
                    ItemGnl.Validate(ItemGnl."Job No.");
                    ItemGnl."Job Task No." := RequisitionLine."Job Task No.";
                    ItemGnl.Validate(ItemGnl."Job Task No.");

                    ItemGnl.Quantity := RequisitionLine."Quantity To  Issue";
                    ItemGnl.Validate(Quantity);
                    ItemGnl."Unit of Measure Code" := RequisitionLine."Unit of Measure";
                    ItemGnl.Validate("Unit of Measure Code");

                    //ItemGnl."ISBN No.":="Taken By";
                    //Ushindi.....
                    ItemGnl."Gen. Prod. Posting Group" := RequisitionLine."Gen. Prod. Posting Group";
                    ItemGnl."Gen. Bus. Posting Group" := RequisitionLine."Gen. Bus. Posting Group";
                    ItemGnl."External Document No." := RequisitionLine."IR Line Reference";
                    //Ushindi

                    ItemGnl."Line No." := Linenumber;
                    //MESSAGE('%1',RequisitionLine."Dimension Set ID");
                    ItemGnl.CopyDim(RequisitionLine."Dimension Set ID");
                    //ItemGnl."Dimension Set ID":=RequisitionLine."Dimension Set ID";
                    //ItemGnl."Dimension Set ID":= DimMgt.GetDimensionSetID(RequisitionLine."Dimension Set ID");

                    //ItemGnl.VALIDATE(ItemGnl."Dimension Set ID");

                    ItemGnl.Insert(true);


                    Linenumber := Linenumber + 10000;
                until RequisitionLine.Next = 0;






                //post journal.
                ItemGnl.Reset;
                ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
                ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
                //ItemGnl.SETRANGE(ItemGnl."Document No.","Requisition No.");
                Codeunit.Run(Codeunit::"Item Jnl.-Post Batch", ItemGnl);



            end else begin
                //ERROR('YOU HAVE NOT SELECTED ANY LINE.PLEASE CHECK!!');
            end;

        end;

        Rec."Taken By" := '';
        Rec.Modify;
        RequisitionLine.Reset;
        RequisitionLine.SetRange(RequisitionLine."Document No.", Rec."No.");
        RequisitionLine.SetRange(RequisitionLine."Document Type", Rec."Document Type");
        // RequisitionLine.SetRange(RequisitionLine.Select, true);
        if RequisitionLine.Find('-') then begin
            repeat
                RequisitionLine."Last Issued By" := UserId;
                RequisitionLine."Last Issue date" := Today;
                RequisitionLine."Last Issue Time" := Time;
                //{IF RequisitionLine."Quantity  issued"<>0 THEN
                RequisitionLine."Quantity Partial Issued" := RequisitionLine."Quantity To  Issue";
                //ELSE
                //RequisitionLine."Quantity Partial Issued":=0;
                RequisitionLine."Quantity  issued" := RequisitionLine."Quantity  issued" + RequisitionLine."Quantity To  Issue";
                //store requisition ledgers

                StoreLedgers.Reset;
                if StoreLedgers.FindLast then
                    entryNo := StoreLedgers."Entry No";

                StoreLedgers.Init;
                StoreLedgers."Entry No" := entryNo + 1;
                StoreLedgers."Document No" := Rec."No.";
                StoreLedgers."Qty. Requested" := RequisitionLine."Qty. Requested";
                StoreLedgers."Qty. Approved" := RequisitionLine."Qty Approved";
                StoreLedgers."Qty. Issued" := RequisitionLine."Quantity To  Issue";
                StoreLedgers."Employee No" := RequisitionLine."Employee No";
                StoreLedgers."Employee Name" := RequisitionLine."Employee Name";
                StoreLedgers."Item No" := RequisitionLine."No.";
                StoreLedgers."Unit Measures" := RequisitionLine."Unit of Measure Code";
                StoreLedgers.Description := RequisitionLine.Description;
                StoreLedgers."Remaining Qty" := RequisitionLine."Qty Approved" - RequisitionLine."Quantity  issued";
                StoreLedgers."Issue Date" := Today;
                StoreLedgers.Insert(true);


                RequisitionLine."Quantity To  Issue" := 0;
                //

                RequisitionLine.Select := false;
                if RequisitionLine."Quantity  issued" = RequisitionLine."Qty. Requested" then begin
                    RequisitionLine."Fully Issued" := true;
                end;
                RequisitionLine.Modify;






            until RequisitionLine.Next = 0;

        end;


        RequisitionLine.Reset;
        RequisitionLine.SetRange(RequisitionLine."Document No.", Rec."No.");
        RequisitionLine.SetRange(RequisitionLine."Document Type", Rec."Document Type");
        RequisitionLine.SetRange(RequisitionLine."Fully Issued", false);

        if RequisitionLine.Count > 0 then begin
            //"Fully Issued":=TRUE;
            //MODIFY;
        end else begin
            Rec."Fully Issued" := true;
            Rec.Modify;

        end;


    end;
}

