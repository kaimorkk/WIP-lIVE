
table 70173 "Bid Opening Register"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.TestField("Bid Opening Nos");
                    NoMgt.TestManual(ProcurementSetup."Bid Opening Nos");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "IFS Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code where(Status = const(Released));

            trigger OnValidate()
            begin
                IFS.Reset;
                IFS.SetRange(Code, "IFS Code");
                if IFS.FindSet then begin
                    Validate("Appointed Bid Opening Com", IFS."Bid Opening Committe");
                    "Primary Region" := IFS."Requesting Region";
                    "Bid Envelop Type" := IFS."Bid Envelop Type";
                    "Tender Name" := IFS."Tender Name";
                    Description := 'Bidder Opening Register for Tender: ' + IFS.Code;
                    "Bid Opening Date" := Today;
                    "Bid Opening Start Time" := Time;
                    rec."Procurement Category" := IFS."Procurement Category ID";
                    "Bid Opening End Date" := IFS."Bid Opening Date";
                    "Bid Opening Venue" := IFS."Bid Opening Venue";
                    "Tender Evaluation Deadline" := CalcDate(ProcurementSetup."Default Tender Evaluation Peri", "Bid Opening Date");
                    "Document Status" := "document status"::Active;
                    BidSecurity.Reset;
                    BidSecurity.SetRange("IFS Code", "IFS Code");
                    if BidSecurity.FindSet then begin
                        "Required Bid Security Amount" := BidSecurity."Security Amount (LCY)";
                    end;
                    "Pre-bid Purchaser Code" := IFS."Purchaser Code";

                end;
            end;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Tender Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Bid Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Bid Opening Start Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Bid Opening End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Bid Opening End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Pre-bid Purchaser Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
            trigger OnValidate()
            var
                myInt: Integer;
                SalesOff: Record "Salesperson/Purchaser";
            begin
                SalesOff.Reset();
                SalesOff.SetRange(Code, rec."Pre-bid Purchaser Code");
                if SalesOff.FindFirst() then
                    rec."Supply Chain Officer Name" := SalesOff.Name;

            end;
        }
        field(10; "No. of Intention To Bid Vendor"; Integer)
        {
            CalcFormula = count("Bid Opening Register Line" where(Code = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "No. of Submitted Bids"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Primary Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Appointed Bid Opening Com"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Appointed Bid Opening Committee';
            TableRelation = "IFS Tender Committee"."Document No.";

            trigger OnValidate()
            begin
                IFSTenderCommitte.Reset;
                IFSTenderCommitte.SetRange("Document No.", "Appointed Bid Opening Com");
                if IFSTenderCommitte.FindSet then begin
                    repeat
                        BidCommitte.Init;
                        BidCommitte."Document No." := Code;
                        BidCommitte."Line No" := IFSTenderCommitte."Line No";
                        BidCommitte."Appointed Bid Opening Com" := "Appointed Bid Opening Com";
                        BidCommitte."Role Type" := IFSTenderCommitte.Role;
                        BidCommitte."Member No." := IFSTenderCommitte."Member No.";
                        BidCommitte."Member Name" := IFSTenderCommitte."Member Name";
                        BidCommitte.Designation := IFSTenderCommitte.Designation;
                        BidCommitte."ID/Passport No" := IFSTenderCommitte."ID/Passport No";
                        BidCommitte."Tax Registration (PIN) No." := IFSTenderCommitte."Tax Registration (PIN) No.";
                        BidCommitte.Email := IFSTenderCommitte."Member Email";
                        BidCommitte."Telephone No." := IFSTenderCommitte."Telephone No.";
                        BidCommitte."Staff  No." := IFSTenderCommitte."Staff  No.";
                        BidCommitte."IFS Code" := "IFS Code";
                        BidCommitte.Insert(true);

                    until IFSTenderCommitte.Next = 0;
                end;
            end;
        }
        field(18; "Bid Envelop Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = '1-Envelop,2-Envelop';
            OptionMembers = "1-Envelop","2-Envelop";
        }
        field(19; "Bid Unsealing Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Technical Opening,Financial Opening';
            OptionMembers = "Technical Opening","Financial Opening";
        }
        field(20; "Final Opening Done"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Tender Evaluation Deadline"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Bid Register No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Required Bid Security Amount"; Decimal)
        {
            Caption = 'Required Bid Security Amount (LCY)';
            DataClassification = ToBeClassified;
            Description = 'Required Bid Security Amount (LCY)';
        }
        field(24; "Bid Opening Venue"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Cancelled';
            OptionMembers = Active,Cancelled;
        }
        field(26; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Posted By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Posted Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Technical,Finance';
            OptionMembers = Technical,Finance;
        }
        field(30; "Opening Person 1"; Code[60])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;

            trigger OnValidate()
            begin
                BidCommitte.Reset;
                BidCommitte.SetRange("Document No.", Code);
                BidCommitte.SetRange("Nominated Bid Opening", BidCommitte."nominated bid opening"::"Member 1");
                if BidCommitte.FindSet then begin
                    if BidCommitte."Opening Person 1" <> "Opening Person 1" then
                        Error('The Code doesnt match the Secret Code sent to your email %1', BidCommitte.Email);
                end;
            end;
        }
        field(31; "Opening Person 2"; Code[60])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;

            trigger OnValidate()
            begin
                BidCommitte.Reset;
                BidCommitte.SetRange("Document No.", Code);
                BidCommitte.SetRange("Nominated Bid Opening", BidCommitte."nominated bid opening"::"Member 2 ");
                if BidCommitte.FindSet then begin
                    if BidCommitte."Opening Person 2" <> "Opening Person 2" then
                        Error('The Code doesnt match the Secret Code sent to your email %1', BidCommitte.Email);
                end;
            end;
        }
        field(32; "Opening Person 3"; Code[60])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;

            trigger OnValidate()
            begin
                BidCommitte.Reset;
                BidCommitte.SetRange("Document No.", Code);
                BidCommitte.SetRange("Nominated Bid Opening", BidCommitte."nominated bid opening"::"Member 3");
                if BidCommitte.FindSet then begin
                    if BidCommitte."Opening Person 3" <> "Opening Person 3" then
                        Error('The Code doesnt match the Secret Code sent to your email %1', BidCommitte.Email);
                end;
            end;
        }
        field(33; "Opening Person 4"; Code[60])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;

            trigger OnValidate()
            begin
                BidCommitte.Reset;
                BidCommitte.SetRange("Document No.", Code);
                BidCommitte.SetRange("Nominated Bid Opening", BidCommitte."nominated bid opening"::"Member 4");
                if BidCommitte.FindSet then begin
                    if BidCommitte."Opening Person 4" <> "Opening Person 4" then
                        Error('The Code doesnt match the Secret Code sent to your email %1', BidCommitte.Email);
                end;
            end;
        }
        field(34; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(35; "Opening Person 5"; Code[60])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;

            trigger OnValidate()
            begin
                BidCommitte.Reset;
                BidCommitte.SetRange("Document No.", Code);
                BidCommitte.SetRange("Nominated Bid Opening", BidCommitte."nominated bid opening"::"Member 5");
                if BidCommitte.FindSet then begin
                    if BidCommitte."Opening Person 5" <> "Opening Person 5" then
                        Error('The Code doesnt match the Secret Code sent to your email %1', BidCommitte.Email);
                end;
            end;
        }
        field(36; "Is Refloated"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin

            end;
        }
        field(37; "Procurement Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code;
        }
        field(38; "Refloated By"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Supply Chain Officer Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("Bid Opening Nos");
            NoMgt.InitSeries(ProcurementSetup."Bid Opening Nos", xRec."No. Series", 0D, Code, "No. Series");
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        IFS: Record "Standard Purchase Code";
        IFSTenderCommitte: Record "IFS Tender Committee Member";
        BidCommitte: Record "Bid Opening Tender Committee";
        BidSecurity: Record "IFS Securities";
}

