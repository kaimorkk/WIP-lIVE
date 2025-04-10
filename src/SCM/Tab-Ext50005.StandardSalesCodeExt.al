tableextension 50005 "Standard Sales Code Ext" extends "Standard Sales Code"
{
    fields
    {
   field(4; "Method of Disposal"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Transfer to Public Entity,Sale by Public Tender,Sale by Public Auction,Trade-in,Waste Disposal Management';
            OptionMembers = " ","Transfer to Public Entity","Sale by Public Tender","Sale by Public Auction","Trade-in","Waste Disposal Management";
        }
        field(5; "Disposal Type"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Disposal Types".Code;
        }
        field(6; "External Document No"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(9; "Project ID"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Job;
        }
        field(10; "Assigned Procurement Officer"; Code[10])
        {
            DataClassification = CustomerContent;
            Description = 'Used to record the assigned Procurement Officer. Mapped to Sales Person/Purchaser table (Filter Role type: Procurement Officer)';
            TableRelation = "Salesperson/Purchaser".Code where("Role Type" = const("Procurement Officer"));
        }
        field(15; "Requesting Directorate"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(16; "Requesting Department"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(18; "Tender Name"; Text[100])
        {
            DataClassification = CustomerContent;
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
            OptionCaption = 'Open,Pending Approval,Released';
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
            //     // FOR i := 1 TO STRLEN("Phone No.") DO
            //     //  IF Char.IsLetter("Phone No."[i]) THEN
            //     //    ERROR(PhoneNoCannotContainLettersErr);
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
        field(31; "Tender Box Location Code"; Code[250])
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
                    //"Bid Charge Bank Branch" := Bank."Bank Branch Name";
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
            Editable = false;
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
        field(54; "Sealed Bids"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(55; "Disposal Requisition No"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Disposal Header".No where(Status = const(Approved));
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
        field(60; "Disposal  Plan ID"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(61; "Disposal  Plan Line No."; Integer)
        {
            DataClassification = CustomerContent;
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
            MaxValue = 100;
            MinValue = 0;
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
        field(93; "Payment Terms Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Used to determine duration within which settlements shall be done for invoiced/completed works (submission of payment certificate for Works). It is linked to the Payment Terms table (T3)';
            TableRelation = "Payment Terms".Code;
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
            OptionCaption = 'Draft,Published,Evaluation,Closed,Cancelled';
            OptionMembers = Draft,Published,Evaluation,Closed,Cancelled;
        }
        field(103; "Cancel Reason Code"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Tender Cancel Reason Code".Code;
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
                UpdateAddress("Responsibility Center");
            end;
        }
        field(108; "Requisition Product Group"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Goods,Services,Works,Assets';
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
            begin
                /*ValidatePurchaserOnPurchHeader(Rec,FALSE,FALSE);
                
                ApprovalEntry.SETRANGE("Table ID",DATABASE::"Purchase Header");
                ApprovalEntry.SETRANGE("Document Type","Document Type");
                ApprovalEntry.SETRANGE("Document No.","No.");
                ApprovalEntry.SETFILTER(Status,'%1|%2',ApprovalEntry.Status::Created,ApprovalEntry.Status::Open);
                IF NOT ApprovalEntry.ISEMPTY THEN
                  ERROR(Text042,FIELDCAPTION("Purchaser Code"));
                
                CreateDim(
                  DATABASE::"Salesperson/Purchaser","Purchaser Code",
                  DATABASE::Vendor,"Pay-to Vendor No.",
                  DATABASE::Campaign,"Campaign No.",
                  DATABASE::"Responsibility Center","Responsibility Center");*/

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
            TableRelation = "IFS Tender Committee"."Document No.";
        }
        field(120; "Bid Evaluation Committe"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "IFS Tender Committee"."Document No.";
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                //ShowDocDim;
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
            TableRelation = Job;

            trigger OnValidate()
            var
                JobRec: Record Job;
            begin
                /*IF JobRec.GET(Job) THEN BEGIN
                  "Job Name":=JobRec.Description;
                  Approver:=JobRec."Project Manager";
                
                END;
                */

            end;
        }
        field(70042; "Requisition Template ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Purchase Requisition Template".Code;
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
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job),
                                                             "Job Task Type" = const(Posting));

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
        field(70159; Posted; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70160; "Posted BY"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70161; "Posted On"; DateTime)
        {
            DataClassification = CustomerContent;
        }
    }


    //Unsupported feature: Code Insertion on "OnInsert".

    //trigger OnInsert()
    //begin
    /*
    IF Code = '' THEN BEGIN
      PurchSetup.GET;
      PurchSetup.TESTFIELD("Disposal Invitation Nos");
      NoSeriesMgt.InitSeries(PurchSetup."Disposal Invitation Nos",xRec.Code,0D,Code,"No. Series");

    END;


    "Created by":=USERID;
    "Created Date/Time":=CURRENTDATETIME;
    */
    //end;

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

    procedure AssistEdit(OldSal: Record "Standard Sales Code"): Boolean
    var
        Cust: Record Customer;
        StdSales: Record "Standard Sales Code";
    begin
        with StdSales do begin
            StdSales := Rec;
            PurchSetup.Get;
            PurchSetup.TestField("ITT No. Series");
            if NoSeriesMgt.SelectSeries(PurchSetup."ITT No. Series", OldSal."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries(Code);
                Rec := StdSales;
                exit(true);
            end;
        end;
    end;


    //Unsupported feature: Property Modification (Id) on "StdSalesLine(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //StdSalesLine : 1000;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //StdSalesLine : 1019;
    //Variable type has not been exported.

    var
        OldSale: Record "Standard Sales Line";
        StdPurchLine: Record "Standard Purchase Line";
        PostCode: Record "Post Code";
        Dimen: Text;
        Dimens: Text;
        DimMgt: Codeunit DimensionManagement;
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetupMgt: Codeunit "User Setup Management";
        RespCenter: Record "Responsibility Center";
        InvtSetup: Record "Inventory Setup";
        PPlanEntry: Record "Procurement Plan Entry";
        IFSfee: Record "Bid Charges Schedule";
        Bank: Record "Bank Account";
        Roads: Record "Fixed Asset";
        PPReservation: Record "PP Purchase Activity Schedule";
        ProcSetup: Record "Procurement Setup";
}