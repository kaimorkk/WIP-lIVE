
/// <summary>
/// TableExtension tableextension50038 (ID 50038) extends Record Standard Purchase Code.
/// </summary>
tableextension 50038 "tableextension50038" extends "Standard Purchase Code"
{
    fields
    {

        //Unsupported feature: Property Insertion (DataClassification) on "Code(Field 1)".


        //Unsupported feature: Property Insertion (Description) on "Code(Field 1)".


        //Unsupported feature: Property Insertion (Editable) on "Code(Field 1)".


        //Unsupported feature: Property Insertion (DataClassification) on "Description(Field 2)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Currency Code"(Field 3)".


        //Unsupported feature: Code Insertion on "Code(Field 1)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        IF Code <> xRec.Code THEN BEGIN
          PurchSetup.GET;
          NoSeriesMgt.TestManual(PurchSetup."ITT No. Series");
          "No. Series" := '';
        END;
        */
        //end;

        //Unsupported feature: Property Deletion (NotBlank) on "Code(Field 1)".



        //Unsupported feature: Code Insertion on "Description(Field 2)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        {IF Purchheader.GET(Description)THEN
          BEGIN
            Description:=Purchheader.Description;
            END}
        */
        //end;
        field(4; "Procurement Method"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction,Public Private Partnership';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction","Public Private Partnership";
            editable = false;
        }
        field(5; "Solicitation Type"; Code[30])
        {
            DataClassification = CustomerContent;
            Description = 'When the Solicitation Type is selcted, the system shall auto-populate the Bid Selection Method and Procurement Method fields';
            TableRelation = "Solicitation Type".Code;
        }
        field(6; "External Document No"; Code[50])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "External Document No" <> '' then begin
                    IIFSS.Reset;
                    IIFSS.SetRange("External Document No", "External Document No");
                    if IIFSS.FindFirst then begin
                        Error('Error!, Kindly note this Reference No has been already been used by %1', IIFSS.Code);
                    end;
                end;
            end;
        }
        field(7; "Procurement Type"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Types".Code;
        }
        field(8; "Procurement Category ID"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Category".Code;
        }
        field(9; "Project ID"; Code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = Job;
            TableRelation = "G/L Budget Name".Name;
        }
        field(10; "Assigned Procurement Officer"; Code[10])
        {
            DataClassification = CustomerContent;
            Description = 'Used to record the assigned Procurement Officer. Mapped to Sales Person/Purchaser table (Filter Role type: Procurement Officer)';
            TableRelation = "Salesperson/Purchaser".Code where("Role Type" = const("Procurement Officer"));
        }
        field(11; "Road Code"; Code[20])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                // Roads.RESET;
                // Roads.SETRANGE("No.","Road Code");
                // IF Roads.FINDSET THEN
                //  "Road Link Name":=Roads.Description
            end;
        }
        field(12; "Road Link Name"; Text[150])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(13; "Constituency ID"; Code[40])
        {
            DataClassification = CustomerContent;
            TableRelation = Constituency.Code;
        }
        field(14; "Requesting Region"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(15; "Requesting Directorate"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(16; "Requesting Department"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(17; "Engineer Estimate (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'This field is based on estimates for Works that usuallly guide bidders/contarctors in specialized industries such as Road construction';
        }
        field(18; "Tender Name"; Text[250])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Description := "Tender Name";
                "Tender Summary" := "Tender Name";
            end;
        }
        field(19; "Tender Summary"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(20; "Document Date"; Date)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(21; Status; Option)
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(22; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(23; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
            DataClassification = CustomerContent;
        }
        field(24; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }
        field(25; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = CustomerContent;
        }
        field(26; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = CustomerContent;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(27; City; Text[30])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(28; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(29; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = CustomerContent;
            ExtendedDatatype = PhoneNo;
            // trigger OnValidate()
            // var
            //     Char: dotnet Char;
            //     i: Integer;
            // begin
            //     for i := 1 to StrLen("Phone No.") do
            //         if Char.IsLetter("Phone No."[i]) then
            //             Error(PhoneNoCannotContainLettersErr);
            // end;
        }
        field(30; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
            Description = 'Copy default Procurement Email from E-Procurement Setup Table';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(31; "Tender Box Location Code"; Code[50])
        {
            Caption = 'Tender Box Location Code';
            DataClassification = CustomerContent;
        }
        field(32; "Bid Charge Code"; Code[30])
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
        field(33; "Bid Charge (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(34; "Bid Charge Bank Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                Bank.Reset;
                Bank.SetRange("No.", "Bid Charge Bank Code");
                if Bank.FindSet then begin
                    "Bank Name" := Bank.Name;
                    "Bank Account Name" := Bank.Name;
                    // "Bid Charge Bank Branch" := Bank."Bank Branch Name";
                    "Bid Charge Bank A/C No" := Bank."Bank Account No.";
                end;
            end;
        }
        field(35; "Bank Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(36; "Bank Account Name"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(37; "Bid Charge Bank Branch"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(38; "Bid Charge Bank A/C No"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(39; Published; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(40; "Created by"; Code[50])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(41; "Submission Start Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(42; "Submission Start Time"; Time)
        {
            DataClassification = CustomerContent;
        }
        field(43; "Submission End Date"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "Tender Validity Expiry Date" := CalcDate("Tender Validity Duration", "Submission End Date");
                "Bid Security Expiry Date" := CalcDate("Bid Security Validity Duration", "Submission End Date");
            end;
        }
        field(44; "Submission End Time"; Time)
        {
            DataClassification = CustomerContent;
        }
        field(45; "No. of Submission"; Integer)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(46; "Enforce Mandatory E-Receipt"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(47; "Bid Document Template"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Document Template"."Template ID";
        }
        field(48; "Display Scoring Criteria Vendo"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(49; "Bid Scoring Template"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Bid Scoring Template".Code;
        }
        field(50; "Created Date/Time"; DateTime)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(51; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            DataClassification = CustomerContent;
        }
        field(52; "Invitation Notice Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Single  Stage Tender,Two Stage Tender,RFQ,Low Value Procurement,Direct Procurement,Framework Agreement,Framework RFQ';
            OptionMembers = ,"Single  Stage Tender","Two Stage Tender",RFQ,"Low Value Procurement","Direct Procurement","Framework Agreement","Special RFQ";
        }
        field(53; "Bid Envelop Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = '1-Envelop,2-Envelop';
            OptionMembers = "1-Envelop","2-Envelop";
        }
        field(54; "Sealed Bids"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(55; "PRN No."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Purchase Requisition"),
             Status = const(Released));
        }
        field(56; "Bid Submission Method"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Manual Bids,Hybrid (Electronic Summary+Hardcopy Submissions),Fully E-Bid';
            OptionMembers = "Manual Bids","Hybrid (Electronic Summary+Hardcopy Submissions)","Fully E-Bid";
        }
        field(57; "Lot No."; Code[30])
        {
            DataClassification = CustomerContent;
            Description = 'Field used to track the different Lots for a given tender. On the system, each tender lot shall be created as a separate Tender record but the Lot No used for informational and tracking purposes only';
        }
        field(58; "LCY Currency Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Linked to General Ledger Setup (LCY Code)';
            TableRelation = Currency.Code;
        }
        field(59; "Works Category"; Code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = "Works Category".Code;
        }
        field(60; "Annual Procurement Plan ID"; Code[30])
        {
            DataClassification = CustomerContent;
            Description = 'Field auto-populated based on selected PP Entry No';
            TableRelation = "Procurement Plan".Code;
        }
        field(61; "Procurement Plan Line No."; Code[30])
        {
            DataClassification = CustomerContent;
            Description = 'Field auto-populated based on selected PP Entry No';
        }
        field(62; "Procurement Plan Entry No1"; Code[30])
        {
            DataClassification = CustomerContent;
            Description = 'Mapped to Procurement Plan Entry No Table';
            TableRelation = "Procurement Plan Entry"."Entry No.";
        }
        field(63; "Financial Year Code"; Code[30])
        {
            DataClassification = CustomerContent;
            Description = 'Linked to Procurement Plan.Financial Year Code';
            Editable = false;
        }
        field(64; "Budget Narration"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(65; "Available Procurement Budget"; Decimal)
        {
            Caption = 'Available Procurement Budget (LCY)';
            DataClassification = CustomerContent;
            Description = 'Linked to PP ENtry';
        }
        field(66; "Publish Engineers Estimate"; Boolean)
        {
            DataClassification = CustomerContent;
            Description = 'Used to determine whether the Engineers Estimate should be published or not. When this is being activated, the system checks to ensure that the Estimate is equal to or less than the stated available budget. If it exceeds the budget, the user is notified and an error notification message is generated';
        }
        field(67; "Procuring Entity Name/Contact"; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(68; "Bid Opening Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(69; "Bid Opening Time"; Time)
        {
            DataClassification = CustomerContent;
        }
        field(70; "Bid Opening Venue"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(71; "Tender Validity Duration"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(72; "Tender Validity Expiry Date"; Date)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(73; "Enforce Mandatory Pre-bid Visi"; Boolean)
        {
            Caption = 'Enforce Mandatory Pre-bid Visit/Meeting';
            DataClassification = CustomerContent;
            Description = 'Enforce Mandatory Pre-bid Visit/Meeting';
        }
        field(74; "Mandatory Pre-bid Visit Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(75; "Domestic Bidder Preference"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(76; "Mandatory Special Group Reserv"; Boolean)
        {
            Caption = 'Mandatory Special Group Reserved';
            DataClassification = CustomerContent;
        }
        field(77; "Bid/Tender Security Required"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(78; "Bid Security %"; Decimal)
        {
            DataClassification = CustomerContent;
            caption = 'Bid Security';
        }
        field(79; "Bid Security Amount (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(80; "Special Group Bid Security"; Boolean)
        {
            Caption = 'Special Group Bid Security Waiver';
            DataClassification = CustomerContent;
            Description = ' Waiver';
        }
        field(81; "Bid Security Validity Duration"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(82; "Bid Security Expiry Date"; Date)
        {
            Caption = 'Bid Security Validity Expiry Date';
            DataClassification = CustomerContent;
            Description = 'Bid Security Validity Expiry Date';
            Editable = false;
        }
        field(83; "Insurance Cover Required"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(84; "Performance Security Required"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(85; "Performance Security %"; Decimal)
        {
            Caption = 'Performance Security % (Of Bid Sum)';
            DataClassification = CustomerContent;
            Description = 'Performance Security % (Of Bid Sum)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(86; "Special Group Performance Secu"; Boolean)
        {
            Caption = 'Special Group Performance Security Waiver';
            DataClassification = CustomerContent;
            Description = 'Special Group Performance Security Waiver';
        }
        field(87; "Advance Payment Security Req"; Boolean)
        {
            Caption = 'Advance Payment Security Required';
            DataClassification = CustomerContent;
            Description = 'Advance Payment Security Required';
        }
        field(88; "Advance Payment Security %"; Decimal)
        {
            Caption = 'Advance Payment Security % (Of Bid Sum)';
            DataClassification = CustomerContent;
            Description = 'Advance Payment Security % (Of Bid Sum)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(89; "Advance Amount Limit %"; Decimal)
        {
            Caption = 'Advance Amount Limit % (Of Bid Sum)';
            DataClassification = CustomerContent;
            Description = 'Advance Amount Limit % (Of Bid Sum)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(90; "Max Works Kickoff Duration"; Code[10])
        {
            Caption = 'Max Works Kickoff Duration (After Contract/Order)';
            DataClassification = CustomerContent;
            Description = 'Max Works Kickoff Duration (After Contract/Order)';
        }
        field(91; "Max Works Charter Duration"; Code[10])
        {
            Caption = 'Max Works Charter/Program Duration (After Contract/Order)';
            DataClassification = CustomerContent;
            Description = 'Max Works Charter/Program Duration (After Contract/Order)';
        }
        field(92; "Max Works Completion Duration"; Code[10])
        {
            Caption = 'Max Works Completion Duration (After Contract/Order';
            DataClassification = CustomerContent;
            Description = 'Max Works Completion Duration (After Contract/Order';
        }
        field(93; "Payment Terms Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Used to determine duration within which settlements shall be done for invoiced/completed works (submission of payment certificate for Works). It is linked to the Payment Terms table (T3)';
            TableRelation = "Payment Terms".Code;
        }
        field(94; "Defects Liability Period"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Defects Liability (Warranty) Period';
        }
        field(95; "Daily Liquidated Dam Unit Cost"; Decimal)
        {
            Caption = 'Daily Liquidated Damages Unit Cost (LCY)';
            DataClassification = CustomerContent;
            Description = 'Daily Liquidated Damages Unit Cost (LCY)';
        }
        field(96; "Liquidated Damages Limit %"; Decimal)
        {
            Caption = 'Liquidated Damages Limit % (Contract Value)';
            DataClassification = CustomerContent;
            Description = 'Liquidated Damages Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(97; "Payment Retention %"; Decimal)
        {
            DataClassification = CustomerContent;
            MaxValue = 100;
            MinValue = 0;
        }
        field(98; "Retention Amount Limit %"; Decimal)
        {
            Caption = 'Retention Amount Limit % (Contract Value)';
            DataClassification = CustomerContent;
            Description = 'Retention Amount Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(99; "Min Interim Certificate Amount"; Decimal)
        {
            Caption = 'Minimum Interim Certificate Amount (LCY)';
            DataClassification = CustomerContent;
        }
        field(100; "Appointer of Bid Arbitrator"; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(101; "Display Scoring Criteria Vend"; Boolean)
        {
            Caption = 'Display Scoring Criteria to Vendors';
            DataClassification = CustomerContent;
            Description = 'Display Scoring Criteria to Vendors';
        }
        field(102; "Document Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Draft,Published,Evaluation,Closed,Cancelled,Re-Tendered';
            OptionMembers = Draft,Published,Evaluation,Closed,Cancelled,"Re-Tendered";
        }
        field(103; "Cancel Reason Code"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Tender Cancel Reason Code".Code;

            trigger OnValidate()
            begin
                if TenderCancelReasonCode.Get("Cancel Reason Code") then begin
                    "Reason For Cancellation" := TenderCancelReasonCode.Description;
                end;
            end;
        }
        field(104; "Parent Invitation No"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'It shall be used to track the Parent ITT in case an Addendum has been done. When the user creates an addendum, the system shall require them to map it to the original ITT (System creates a new ITT that references, the original ITT, and then blocks the Parent ITT. A user can view all the Addenda against a Parent ITT)';
        }
        field(105; "Target Bidder Group"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'All Bidders,Local Bidders,International Bidders';
            OptionMembers = "All Bidders","Local Bidders","International Bidders";
        }
        field(106; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
            TableRelation = Location where("Use As In-Transit" = const(false));

            trigger OnValidate()
            begin
                /*TestStatusOpen;
                IF ("Location Code" <> xRec."Location Code") AND
                   (xRec."Buy-from Vendor No." = "Buy-from Vendor No.")
                THEN
                  MessageIfPurchLinesExist(FIELDCAPTION("Location Code"));
                
                UpdateShipToAddress;
                
                IF "Location Code" = '' THEN BEGIN
                  IF InvtSetup.GET THEN
                    "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
                END ELSE BEGIN
                  IF Location.GET("Location Code") THEN;
                  "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
                END;
                */

            end;
        }
        field(107; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                // TestStatusOpen;
                // IF NOT UserSetupMgt.CheckRespCenter(1,"Responsibility Center") THEN
                //  ERROR(
                //    Text028,
                //    RespCenter.TABLECAPTION,UserSetupMgt.GetPurchasesFilter);
                //
                // "Location Code" := UserSetupMgt.GetLocation(1,'',"Responsibility Center");
                //
                //
                // UpdateAddress("Responsibility Center");
            end;
        }
        field(108; "Requisition Product Group"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Goods,Services,Works,...';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(109; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            DataClassification = CustomerContent;
            TableRelation = Language;

            trigger OnValidate()
            begin
                //MessageIfPurchLinesExist(FIELDCAPTION("Language Code"));
            end;
        }
        field(110; "Purchaser Code"; Code[20])
        {
            Caption = 'Purchaser Code';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            var
                ApprovalEntry: Record "Approval Entry";
                SalesOrder: Record "Salesperson/Purchaser";
            begin
                SalesOrder.reset;
                SalesOrder.SetRange(SalesOrder.Code, rec."Purchaser Code");
                if SalesOrder.findfirst then begin
                    Rec."Purchaser Code" := SalesOrder."Employee No";
                    Rec."Purchaser Name" := SalesOrder.name;
                end

                // /*ValidatePurchaserOnPurchHeader(Rec,FALSE,FALSE);

                // ApprovalEntry.SETRANGE("Table ID",DATABASE::"Purchase Header");
                // ApprovalEntry.SETRANGE("Document Type","Document Type");
                // ApprovalEntry.SETRANGE("Document No.","No.");
                // ApprovalEntry.SETFILTER(Status,'%1|%2',ApprovalEntry.Status::Created,ApprovalEntry.Status::Open);
                // IF NOT ApprovalEntry.ISEMPTY THEN
                //   ERROR(Text042,FIELDCAPTION("Purchaser Code"));

                // CreateDim(
                //   DATABASE::"Salesperson/Purchaser","Purchaser Code",
                //   DATABASE::Vendor,"Pay-to Vendor No.",
                //   DATABASE::Campaign,"Campaign No.",
                //   DATABASE::"Responsibility Center","Responsibility Center");*/

            end;
        }
        field(111; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(112; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                
                PurchaseReqDet.VALIDATE(PurchaseReqDet."No."); */

            end;
        }
        field(113; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 1 Code';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                 END;*/

            end;
        }
        field(114; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Dimen := "Global Dimension 3 Code";
                Dimen := CopyStr(Dimen, 1, 3);
                "Global Dimension 2 Code" := Dimen;
                Dimens := "Global Dimension 3 Code";
                Dimens := CopyStr(Dimens, 1, 1);
                "Global Dimension 1 Code" := Dimens;

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 3 Code":="Global Dimension 3 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                
                 END;
                
                {IF "Global Dimension 2 Code" = '' THEN
                  EXIT;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
                
                }  */

            end;
        }
        field(115; "Primary Tender Submission"; Text[80])
        {
            Caption = 'Primary Tender Submission Address';
            DataClassification = CustomerContent;
            Description = 'Primary Tender Submission Address';
        }
        field(116; "Primary Engineer Contact"; Text[80])
        {
            Caption = 'Primary Engineer Contact Address';
            DataClassification = CustomerContent;
            Description = 'Primary Engineer Contact Address';
        }
        field(117; "Cancellation Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(118; "Cancellation Secret Code"; Code[50])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = Masked;
        }
        field(119; "Bid Opening Committe"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "IFS Tender Committee"."Document No." where("Committee Type" = const('OPENING'), "Approval Status" = filter(Released));
        }
        field(120; "Bid Evaluation Committe"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "IFS Tender Committee"."Document No." where("Committee Type" = const('EVALUATION'), "Approval Status" = filter(Released));
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Global Dimension 2 Code");
            end;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70019; Division; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70020; Job; Code[50])
        {
            DataClassification = CustomerContent;
            Editable = false;
            //TableRelation = Job;
            TableRelation = "G/L Budget Name".Name;
        }
        field(70042; "Requisition Template ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Purchase Requisition Template".Code;
        }
        field(70046; "Procurement Plan ID"; Code[30])
        {
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Procurement Plan".Code;
        }
        field(70047; "Procurement Plan Entry No"; Integer)
        {
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin
                PPlanEntry.Reset;
                PPlanEntry.SetRange("Entry No.", "Procurement Plan Entry No");
                if PPlanEntry.Find('-') then begin
                    "PP Planning Category" := PPlanEntry."Planning Category";
                    "PP Funding Source ID" := PPlanEntry."Funding Source ID";
                    "PP Total Budget" := PPlanEntry."Available Procurement Budget";
                    "PP Total Actual Costs" := PPlanEntry."Total Actual Costs";
                    // "PP Total Commitments" := PPlanEntry."Total Purchase Commitments";
                    "PP Solicitation Type" := PPlanEntry."Solicitation Type";
                    "PP Procurement Method" := PPlanEntry."Procurement Method";
                    "PP Preference/Reservation Code" := PPlanEntry."Preference/Reservation Code";


                end;
            end;
        }
        field(70048; "PP Planning Category"; Code[50])
        {
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Procurement Plan Entry"."Planning Category";
        }
        field(70049; "PP Funding Source ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Editable = false;
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
        field(70054; "Stage 1 EOI Invitation"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Request For Information";
        }
        field(70055; "Prebid Meeting Address"; Text[60])
        {
            DataClassification = CustomerContent;
        }
        field(70056; "Prebid Meeting Register ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "IFS Prebid Register";
        }
        field(70057; "Date/Time Published"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(70058; "Cancelled By"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70060; "PP Solicitation Type"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Solicitation Type".Code;
        }
        field(70061; "PP Procurement Method"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(70062; "PP Preference/Reservation Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Special Vendor Category".Code;
        }
        field(70066; "Bid Selection Method"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Bid Selection Method".Code;
        }
        field(70067; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = CustomerContent;
            Editable = false;
            //  TableRelation = "G/L Budget Entry"."Entry No." where("Budget Name" = field("Job"), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Code"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Code"));
            TableRelation = "G/L Account"."No." where(Blocked = const(false));
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
        field(70068; "Sent Cancellation Secret Code"; Code[50])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70069; "Supplier Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Prequalified Supplier,Registered Supplier';
            OptionMembers = "Prequalified Supplier","Registered Supplier";
        }
        field(70154; "Sealed Bids (Technical)"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70155; "Sealed Bids (Financial)"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70156; "Bid Opening Register"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70157; "Finance Opening Register"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70158; "Finance Bid Opening Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70159; "Sample Delivery Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70160; "Procurement Category"; Text[1000])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Validate("Supplier Type");
            end;
        }
        field(70162; "Awarded Bidder No"; Code[50])
        {
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = Vendor."No.";
        }
        field(70163; "Awarded Quote No"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Quote),
                                                           "Invitation For Supply No" = field(Code));

            trigger OnValidate()
            begin
                Purchheader.Reset;
                Purchheader.SetRange("No.", "Awarded Quote No");
                if Purchheader.FindSet then begin
                    "Awarded Bidder No" := Purchheader."Buy-from Vendor No.";
                    "Awarded Bidder Name" := Purchheader."Buy-from Vendor Name";
                    Purchheader.CalcFields("Amount Including VAT");
                    "Awarded Bidder Sum" := Purchheader."Amount Including VAT";
                end;
            end;
        }
        field(70164; Posted; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70165; "Posted By"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70166; "Posted On"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(70167; "No Of Supliers To Invite"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(75000; "Document Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'IFS,Disposal';
            OptionMembers = IFS,Disposal;
        }
        field(75001; "Disposal Requisition No"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(75002; "Disposal Plan No"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(75003; "Preliminary Evaluation"; Text[255])
        {
            DataClassification = CustomerContent;
            Description = ' Under Quotation';
        }
        field(75004; Archive; Boolean)
        {
            DataClassification = CustomerContent;
            Description = 'To archive wrongly created quotations';
        }
        field(75005; "Resason To Reopen"; Text[255])
        {
            DataClassification = CustomerContent;
        }
        field(75006; "Actual Bid Opening Date"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(75007; "Framework Agreement No"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Blanket Order"));
        }
        field(75008; "Agreement Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,New,Existing';
            OptionMembers = " ",New,Existing;
        }
        field(75009; "Technical Specification"; Text[2000])
        {
            DataClassification = CustomerContent;
        }
        field(75010; "Special RFQ"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(75011; "Reason For Cancellation"; Text[2000])
        {
            DataClassification = CustomerContent;
        }
        field(75012; "Retendered By"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(75013; "Retendered On"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(75014; "Awarded Bidder Name"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(75015; "Awarded Bidder Sum"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(75016; "RFQ Sent"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Request Sent';
            Editable = false;
        }
        field(75017; "RFQ Sent By"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Request Sent By';
            Editable = false;
        }
        field(75018; "RFQ Sent On"; DateTime)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(75019; "Has an Email Attachment ?"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(75020; "Submission Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Draft,Submitted';
            OptionMembers = Draft,Submitted;
        }
        field(75021; "Purchaser Name"; text[100])
        {
            DataClassification = ToBeClassified;
            caption = 'Purchaser Name';
        }
        field(75022; "RFQ Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(75023; "Preliminary Evaluated"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(75024; "Technical Evaluated"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(75025; "Financial Evaluated"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }


    //Unsupported feature: Code Insertion on "OnInsert".

    //trigger OnInsert()
    //begin
    /*
    IF Code = '' THEN BEGIN
      PurchSetup.GET;
      PurchSetup.TESTFIELD("ITT No. Series");
      NoSeriesMgt.InitSeries(PurchSetup."ITT No. Series",xRec.Code,0D,Code,"No. Series");

    END;


    "Created by":=USERID;
    "Created Date/Time":=CURRENTDATETIME;
    ProcSetup.GET;
    "Tender Validity Duration":=ProcSetup."Tender Validity Duration";
    */
    //end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        // OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID", StrSubstNo('%1 %2', '', Code),
        //     "Global Dimension 1 Code", "Global Dimension 2 Code");

        // IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
        //     MODIFY;
        //     IF PurchLinesExist THEN
        //         UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        // END

    end;

    procedure TestStatusOpen()
    begin
        OnBeforeTestStatusOpen;



        TestField(Status, Status::Open);

        OnAfterTestStatusOpen;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeTestStatusOpen()
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
        DocNo := '';
        ProcurementSetup.Get();
        BidRegister.Reset();
        BidRegister.init;
        DocNo := NoSeriesMgt.GetNextNo(ProcurementSetup."Bid Opening Nos", 0D, true);
        BidRegister.code := DocNo;
        BidRegister."IFS Code" := rec.Code;
        BidRegister.Validate(BidRegister."IFS Code");
        BidRegister.insert;
    end;


    [IntegrationEvent(true, false)]
    local procedure OnAfterTestStatusOpen()
    begin
    end;

    procedure UpdateAddress(Respcode: Code[10])
    var
        Resp: Record "Responsibility Center";
    begin
        Resp.Reset;
        Resp.SetRange(Code, Respcode);
        if Resp.FindSet then begin

            "Procuring Entity Name/Contact" := Resp.Name;
            Validate(Address, Resp.Address);
            Validate("Address 2", Resp."Address 2");
            Validate("Post Code", Resp."Post Code");
            Validate(City, Resp.City);
            Validate("Country/Region Code", Resp."Country/Region Code");
            Validate("Phone No.", Resp."Phone No.");
            Validate("E-Mail", Resp."E-Mail");

        end;
    end;

    var
        PostCode: Record "Post Code";
        PhoneNoCannotContainLettersErr: label 'You cannot enter letters in this field.';
        Dimen: Text;
        Dimens: Text;
        DimMgt: Codeunit DimensionManagement;
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetupMgt: Codeunit "User Setup Management";
        Text028: label 'Your identification is set up to process from %1 %2 only.';
        RespCenter: Record "Responsibility Center";
        InvtSetup: Record "Inventory Setup";
        PPlanEntry: Record "Procurement Plan Entry";
        IFSfee: Record "Bid Charges Schedule";
        Bank: Record "Bank Account";
        Roads: Record "Fixed Asset";
        PPReservation: Record "PP Purchase Activity Schedule";
        ProcSetup: Record "Procurement Setup";
        Purchheader: Record "Purchase Header";
        TenderCancelReasonCode: Record "Tender Cancel Reason Code";
        IIFSS: Record "Standard Purchase Code";
}

