
table 70084 "Request For Information"
{
    Caption = 'Request For Information';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[22])
        {
            Description = 'Link to  No Series on the E-Procurement Setup Table (Different No. Series shall be defined for different Request for Information e.g. IFP,EOI';
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "Tender Summary"; Text[250])
        {
        }
        field(5; "Primary Target Vendor Cluster"; Option)
        {
            Description = 'This is used for categorization of the prequalifications since the different supplier clusters may have different sets of unique requirements. NB: We separate Contractors because of the dedicated Contractors Portal used during Project execution';
            OptionCaption = ',Suppliers,Consultants,Contractors';
            OptionMembers = ,Suppliers,Consultants,Contractors;
        }
        field(6; "Document Date"; Date)
        {
        }
        field(7; "External Document No"; Code[50])
        {
            Description = 'For external references such as Memo etc';
        }
        field(8; "Period Start Date"; Date)
        {
            Description = 'Indicate the Prequalification Start Date (To define period of prequalification of the vendor)';
        }
        field(9; "Period End Date"; Date)
        {
            Description = 'Indicate the Prequalification End Date (To define period of prequalification of the vendor)';
        }
        field(10; Status; Option)
        {
            Caption = 'Status';
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(11; Name; Text[100])
        {
            Caption = 'Name';
            Description = 'Used to record submission details of the Procuring entity such as Name, Office, Address etc';
        }
        field(12; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(13; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(14; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(15; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
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
        field(16; City; Text[30])
        {
            Caption = 'City';
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
        field(17; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(18; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;

            // trigger OnValidate()
            // var
            //     Char: dotnet Char;
            //     i: Integer;
            // begin
            //     for i := 1 to StrLen("Phone No.") do
            //       if Char.IsLetter("Phone No."[i]) then
            //         Error(PhoneNoCannotContainLettersErr);
            // end;
        }
        field(19; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            Description = 'Copy default Procurement Email from E-Procurement Setup Table';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(20; "Tender Box Location Code"; Code[50])
        {
            Caption = 'Tender Box Location Code';
        }
        field(21; "Prequalification Charge Code"; Code[30])
        {
            Description = 'Linked to Prequalification Charges Schedule Table. Used to define all charges that a potential vendor/bidder should pay in advance before submission of the IFP. It should be defaulted from the E-Procurement Setup Table';
            TableRelation = "Bid Charges Schedule".Code;

            trigger OnValidate()
            begin
                RFIfee.Reset;
                RFIfee.SetRange(Code, "Prequalification Charge Code");
                if RFIfee.FindSet then begin
                    "Charge Amount (LCY)" := RFIfee.Amount
                end;
            end;
        }
        field(22; Published; Boolean)
        {
            Description = 'To determine IFPs that have been published to the E-Procurement portal';
        }
        field(23; "Created by"; Code[50])
        {
        }
        field(24; "Submission Start Date"; Date)
        {
            Description = 'To determine earliest Date when potential bidders can submit their prequalification proposals';
        }
        field(25; "Submission Start Time"; Time)
        {
            Description = 'To determine earliest Time when potential bidders can submit their prequalification proposals';
        }
        field(26; "Submission End Date"; Date)
        {
        }
        field(27; "Submission End Time"; Time)
        {
        }
        field(28; "No. of Submission"; Integer)
        {
            CalcFormula = count("RFI Response" where("RFI Document No." = field(Code)));
            Description = 'Calcfield that counts the total number of submissions made against a specific IFP';
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Enforce Mandatory E-Receipt"; Boolean)
        {
            Description = 'When this is enforced, the system will require that all IFP receipts are processed on the system in advance, and each submission will only proceed once the user has selected a valid E-Receipt No. If not enforced, the user shall be allowed to put the payment reference only, which shall be validated later on by Back-office operations';
        }
        field(30; "Procurement Document Template"; Code[10])
        {
            TableRelation = "Procurement Document Template"."Template ID";
        }
        field(31; "Display Scoring Criteria Vendo"; Boolean)
        {
            Description = 'When this is enabled for the IFP, the selected Scoring Criteria shall be available in the portal based on the selected scoring template. The default Display Scoring Criteria to Vendors field in the E-Procurement Setup shall generally be inherited for all IFPs and other Solicitation Types';
        }
        field(32; "RFI Scoring Template"; Code[10])
        {
            TableRelation = "Bid Scoring Template";
        }
        field(33; "Created Date/Time"; DateTime)
        {
        }
        field(34; "Summarized Terms & Conditions"; Text[250])
        {
            Description = 'BLOB field that shall include T&C applicable to the IFP.';
        }
        field(35; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(36; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
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
        field(37; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 1 Code';
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
        field(38; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';

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
        field(39; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
        }
        field(40; "Document Type"; Option)
        {
            OptionCaption = ',Invitation For Prequalification,EOI Invitation';
            OptionMembers = ,"Invitation For Prequalification","EOI Invitation";
        }
        field(41; "Assigned Procurement Officer"; Code[20])
        {
            TableRelation = "Salesperson/Purchaser".Code where("Role Type" = const("Procurement Officer"));
        }
        field(42; "Procurement Type"; Code[30])
        {
            TableRelation = "Procurement Types".Code;
        }
        field(43; "Solicitation Type"; Code[30])
        {
            TableRelation = "Solicitation Type".Code;
        }
        field(44; Region; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Region));
        }
        field(45; "Charge Amount (LCY)"; Decimal)
        {
        }
        field(46; "Charge Bank Code"; Code[20])
        {
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                Bank.Reset;
                Bank.SetRange("No.", "Charge Bank Code");
                if Bank.FindSet then begin
                    "Bank Name" := Bank.Name;
                    "Account Holder Name" := Bank.Name;
                    // "Charge Bank Branch" := Bank."Bank Branch Name";
                    "Charge Bank A/C No" := Bank."Bank Account No.";
                end;
            end;
        }
        field(47; "Bank Name"; Text[50])
        {
            Editable = false;
        }
        field(48; "Account Holder Name"; Text[50])
        {
        }
        field(49; "Charge Bank Branch"; Code[50])
        {
        }
        field(50; "Charge Bank A/C No"; Code[50])
        {
        }
        field(51; "Date/Time Published"; DateTime)
        {
        }
        field(52; "RFI Document Status"; Option)
        {
            OptionCaption = 'Draft,Published,Submissions Closed,Canceled,Evaluation Stage,Closed';
            OptionMembers = Draft,Published,"Submissions Closed",Canceled,"Evaluation Stage",Closed;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
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
    }

    keys
    {
        key(Key1; "Code", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Status, Description)
        {
        }
    }

    trigger OnDelete()
    begin
        if Status <> Status::Open then
            Error('You cannot delete a document that is already approved or pending approval');
    end;

    trigger OnInsert()
    begin
        if Code = '' then begin

            if "Document Type" = "document type"::"Invitation For Prequalification" then begin
                PurchSetup.Get;
                PurchSetup.TestField("IFP Nos.");
                NoSeriesMgt.InitSeries(PurchSetup."IFP Nos.", xRec.Code, 0D, Code, "No. Series");
            end else begin
                PurchSetup.Get;
                PurchSetup.TestField("EOI No. Series");
                NoSeriesMgt.InitSeries(PurchSetup."EOI No. Series", xRec.Code, 0D, Code, "No. Series");
            end;
        end;


        "Created by" := UserId;
        "Created Date/Time" := CurrentDatetime;

        //Company info Details
        CompanyInfo.Get;
        Name := CompanyInfo.Name;
        Address := CompanyInfo.Address;
        "Address 2" := CompanyInfo."Address 2";
        "Post Code" := CompanyInfo."Post Code";
        City := CompanyInfo.City;
        "Country/Region Code" := CompanyInfo."Country/Region Code";
        "Phone No." := CompanyInfo."Phone No.";
        "E-Mail" := CompanyInfo."E-Mail";
    end;

    trigger OnModify()
    begin
        //IF Status<>Status::Open THEN
        //ERROR('You cannot modify a document that is already approved or pending approval');
    end;

    var
        Empl: Record Employee;
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UsersRec: Record "User Setup";
        PurchLine: Record "Requisition Lines1";
        Vend: Record Vendor;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchaseRecLine: Record "Requisition Lines1";
        Text000: label 'Please Select the Supplier';
        Text001: label 'Purchase Order No %1 has been created';
        Dimen: Text;
        Dimens: Text;
        PostCode: Record "Post Code";
        PhoneNoCannotContainLettersErr: label 'You cannot enter letters in this field.';
        Bank: Record "Bank Account";
        DimMgt: Codeunit DimensionManagement;
        CompanyInfo: Record "Company Information";
        RFIfee: Record "Bid Charges Schedule";


    procedure PurchLinesExist(): Boolean
    begin
        PurchLine.Reset;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SetRange("Requisition No", Code);
        exit(PurchLine.FindFirst);
    end;


    procedure QuantityExist(): Boolean
    begin
        PurchLine.Reset;
        PurchLine.SetRange("Requisition No", Code);
        if PurchLine.Find('-') then
            repeat
                if PurchLine.Quantity <= 0 then
                    exit(false)
                else
                    exit(true);
            until
            PurchLine.Next = 0;
    end;


    procedure LocationCodeExist() LocationExist: Boolean
    begin
        PurchLine.Reset;
        PurchLine.SetRange("Requisition No", Code);
        if PurchLine.Find('-') then
            repeat
                if PurchLine."Location Code" = '' then
                    LocationExist := false
                else
                    LocationExist := true;
            until
            PurchLine.Next = 0;
        exit(LocationExist);
    end;


    procedure CreatePurchaseOrder(var PurchaseRec: Record "Requisition Header1")
    begin

        with PurchaseRec do begin

            if PurchaseRec."Supplier Code" = '' then
                Error(Text000);


            //Purchase Header
            PurchaseHeader.Init;
            PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
            PurchaseHeader."No." := '';
            PurchaseHeader."Buy-from Vendor No." := PurchaseRec."Supplier Code";
            PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
            //IF NOT PurchaseHeader.GET(PurchaseHeader."No.") THEN
            PurchaseHeader.Insert(true);


            PurchaseRecLine.Reset;
            PurchaseRecLine.SetRange("Requisition No", PurchaseRec."No.");
            if PurchaseRecLine.Find('-') then begin
                repeat
                    //Purchase Lines
                    PurchaseLine.Reset;
                    PurchaseLine.SetRange(PurchaseLine."Document Type", PurchaseLine."document type"::Order);
                    PurchaseLine.SetRange(PurchaseLine."Document No.", PurchaseHeader."No.");
                    PurchaseLine.SetRange(PurchaseLine."Line No.", PurchaseRecLine."Line No");
                    PurchaseLine.SetRange(PurchaseLine."Buy-from Vendor No.", PurchaseRec."Supplier Code");
                    if not PurchaseLine.FindFirst then begin
                        PurchaseLine.Init;
                        PurchaseLine."Document Type" := PurchaseLine."document type"::Order;
                        PurchaseLine."Document No." := PurchaseHeader."No.";
                        PurchaseLine."Line No." := PurchaseRecLine."Line No";//PurchaseLine.VALIDATE(PurchaseLine."No.");
                        PurchaseLine."Buy-from Vendor No." := PurchaseRec."Supplier Code";
                        PurchaseLine.Type := PurchaseRecLine.Type;
                        PurchaseLine."No." := PurchaseRecLine.No;
                        PurchaseLine.Description := PurchaseRecLine.Description;
                        PurchaseLine."Unit of Measure" := PurchaseRecLine."Unit of Measure";
                        PurchaseLine.Quantity := PurchaseRecLine.Quantity;
                        PurchaseLine."Direct Unit Cost" := PurchaseRecLine."Unit Cost";
                        PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");
                        PurchaseLine."Location Code" := PurchaseRecLine."Location Code";
                        PurchaseLine."Procurement Plan" := PurchaseRecLine."Procurement Plan";
                        PurchaseLine."Procurement Plan Item" := PurchaseRecLine."Procurement Plan Item";
                        if not PurchaseLine.Get(PurchaseLine."document type"::Order, PurchaseHeader."No.", PurchaseRecLine."Line No") then
                            PurchaseLine.Insert(true);
                    end;
                until PurchaseRecLine.Next = 0;
                //CODEUNIT.RUN(CODEUNIT::"Purch.-Quote to Order",PurchaseHeader);
            end;

            Message(Text001, PurchaseHeader."No.");


        end;
    end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1 %2',"Document Type",Code),
        //     "Global Dimension 1 Code","Global Dimension 2 Code");

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;
}

