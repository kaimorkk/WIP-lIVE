tableextension 50001 "Standard Vendor Purchase CodeE" extends "Standard Vendor Purchase Code"
{
    fields
    {
         modify("Vendor No.")
        {
            TableRelation = "Vendor Prequalification Entry"."Vendor No." where("Procurement Category Code" = field(Category));

        }
        field(19; "IFS Code"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(20; "Bid No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(21; "Vendor Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(22; "Primary Email"; Text[80])
        {
            DataClassification = CustomerContent;
            Description = 'Linked to Vendor.Primary Email (It shall be used for vendor communications during the bidding process)';
        }
        field(23; "Positive Intent To Bid"; Boolean)
        {
            DataClassification = CustomerContent;
            Description = 'This field is updated based on the invited bidder''s acknowledgement of their intent to participate in the IFS';
        }
        field(24; "Invitation Email Sent"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(25; "Date/Time Notified"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(26; "No. of Posted Addendum Notices"; Integer)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(27; "Posted Addendum Notice No."; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Last Posted Addendum Notice No.';
        }
        field(28; "Bid Currency Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Currency.Code;
        }
        field(29; "Sealed Bids (Technical)"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(30; "Sealed Bids (Financial)"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(31; "Prebid Register No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "IFS Prebid Register".Code;
        }
        field(32; "Prebid Meeting Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(33; "Bid Opening Register No."; Code[20])
        {
            Caption = 'Bid Opening Register No.  (Technical)';
            DataClassification = CustomerContent;
            Description = 'Bid Opening Register No.  (Technical)';
            TableRelation = "Bid Opening Register".Code;
        }
        field(34; "Bid Opening Date (Technical)"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(35; "Late Bid (Opening Stage)"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(36; "Withdrawn Bid (Opening Stage)"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(37; "Bid Withdrawal Notice No"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(38; "Modified Bid (Opening Stage)"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(39; "Bid Opening Result"; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(40; "Bid Opening Committee Remarks"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(41; "Preliminary Evaluation Reg"; Code[20])
        {
            Caption = 'Preliminary Evaluation Register No.';
            DataClassification = CustomerContent;
            Description = 'Preliminary Evaluation Register No.';
        }
        field(42; "Preliminary Evaluation Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(43; "Preliminary Evaluation Outcome"; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(44; "Preminary Evaluation Committee"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Preminary Evaluation)';
            DataClassification = CustomerContent;
            Description = 'Evaluation Committee Remarks (Preminary Evaluation)';
        }
        field(45; "Technical Evaluation Reg"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Technical Evaluation Register No.';
        }
        field(46; "Technical Evaluation Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(47; "Min Weighted Tech Pass Score %"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'Minimum Weighted Tech Pass Score %';
        }
        field(48; "Weighted Technical  Score %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(49; "Technical Evaluation  Outcome"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(50; "Evaluation Committee Rem"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Technical Evaluation)';
            DataClassification = CustomerContent;
            Description = 'Evaluation Committee Remarks (Technical Evaluation)';
        }
        field(51; "Technical Evaluation Committee"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(52; "Bid Opening Finance Register"; Code[20])
        {
            Caption = 'Bid Opening Register No.  (Financial)';
            DataClassification = CustomerContent;
            Description = 'Bid Opening Register No.  (Financial)';
        }
        field(53; "Bid Opening Date (Financial)"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(54; "Financial Eval Register No"; Code[20])
        {
            Caption = 'Financial Evaluation Register No';
            DataClassification = CustomerContent;
            Description = 'Financial Evaluation Register No';
        }
        field(55; "Financial Evaluation Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(56; "Read-out Bid Price (A)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(57; "Arithmetic Corrections (B)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(58; "Corrected Bid Price (C=A+B)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(59; "Unconditional Discount % (D)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(60; "Unconditional Disc Amount (E)"; Decimal)
        {
            Caption = 'Unconditional Discount Amount (E)';
            DataClassification = CustomerContent;
            Description = 'Unconditional Discount Amount (E)';
        }
        field(61; "Corrected & Disc Bid Price"; Decimal)
        {
            Caption = 'Corrected & Discounted Bid Price (F=C-E)';
            DataClassification = CustomerContent;
            Description = 'Corrected & Discounted Bid Price (F=C-E)';
        }
        field(62; "Any Additional Adjustments (G)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(63; "Any Priced Deviations (H))"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(64; "Final Evaluated Bid Price"; Decimal)
        {
            Caption = 'Final Evaluated Bid Price (I=F+G+H)';
            DataClassification = CustomerContent;
            Description = 'Final Evaluated Bid Price (I=F+G+H)';
        }
        field(66; "Weighted Financial Score %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(67; "Financial Evaluation Ranking"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(68; "Financial Evaluation Comm Rem"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Financial Evaluation)';
            DataClassification = CustomerContent;
            Description = 'Evaluation Committee Remarks (Financial Evaluation)';
        }
        field(69; "Aggregate Weighted Score %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70; "Evaluation Committee Recomm"; Option)
        {
            DataClassification = CustomerContent;
            Description = 'Evaluation Committee Recommendation';
            OptionCaption = ',Award,Unsuccesful';
            OptionMembers = ,Award,Unsuccesful;
        }
        field(71; "Final Evaluation Report"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(72; "Final Evaluation Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(73; "Professional Opion ID"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Bid Tabulation Header".Code;
        }
        field(74; "Professional Opion Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(75; "Due Dilgence Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(76; "Due Diligence Rating"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Due Diligence Assessment Rating';
        }
        field(77; "Due Diligence Report ID"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(78; "Due Diligence Voucher"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(79; Category; Code[50])
        {
            CalcFormula = lookup("Standard Purchase Code"."Procurement Category ID" where(Code = field(Code)));
            FieldClass = FlowField;
            Editable = false;
            TableRelation = "Procurement Category".Code;
        }
        field(80; "Supplier Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Prequalified Supplier,Registered Supplier';
            OptionMembers = "Prequalified Supplier","Registered Supplier";
        }
        field(81; "Award Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Single Award,Multiple Award';
            OptionMembers = " ","Single Award","Multiple Award";
        }
        field(82; "Finance Bid Evaluation Registe"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(83; "Vendor Phone No."; Text[300])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = PhoneNo;
        }

        field(84; "Supplier No."; Code[20])
        {
            Caption = 'Supplier No.';
            TableRelation = "Vendor Prequalification Entry"."Vendor No." where("Procurement Category Code" = field(Category));
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
                StdPurchCode: Record "Standard Purchase Code";
            begin

                Vend.RESET;
                Vend.SETRANGE("No.", "Vendor No.");
                if Vend.FINDSET then begin
                    Vend.TESTFIELD("E-Mail");
                    "Vendor Name" := Vend.Name;
                    "Primary Email" := Vend."E-Mail";
                    "Vendor Phone No." := Vend."Phone No.";

                end;
            end;
        }
    }
    var
        Vend: Record Vendor;
}
