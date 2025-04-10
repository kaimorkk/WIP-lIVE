Table 70182 "Bid Tabulation Line"
{
    DataClassification = CustomerContent;
    // DrillDownPageID = "Bid Tabulation Line";
    // LookupPageID = "Bid Tabulation Line";

    fields
    {
        field(1; "Tabulation ID"; Code[20])
        {
            TableRelation = "Bid Tabulation Header";
        }
        field(2; "Tabulation Type"; Option)
        {
            OptionCaption = 'Evaluation Report,Professional Opinion,Notice of Award';
            OptionMembers = "Evaluation Report","Professional Opinion","Notice of Award";
        }
        field(3; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(4; "No."; Code[20])
        {
            TableRelation = "Purchase Header"."No.";
        }
        field(5; "Bidder No"; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vend.Reset;
                Vend.SetRange("No.", "Bidder No");
                if Vend.FindSet then begin
                    "Bidder Name" := Vend.Name;
                    //   Classification:=Vend.Classification;
                    //   Manufacturer:=Vend.Manufacturer;
                    //  "AGPO Category":=Vend."AGPO Category";
                    //  "AGPO Certficate Number":=Vend."AGPO Certficate Number";
                    //  Country:=Vend.Country;

                end;
            end;
        }
        field(6; "Bidder Name"; Text[80])
        {
            Editable = false;
        }
        field(7; "Invitation For Supply No"; Code[20])
        {
            TableRelation = "Standard Purchase Code";
        }
        field(8; "Bid Currency Code"; Code[20])
        {
            TableRelation = Currency.Code;
        }
        field(9; "Pre-bid Register No."; Code[20])
        {
        }
        field(10; "Attended Pre-bid Conference"; Boolean)
        {
        }
        field(11; "Prebid Conference Date"; Date)
        {
        }
        field(12; "Bid Opening Register No."; Code[20])
        {
            TableRelation = "Bid Opening Register".Code;
        }
        field(13; "Bid Opening Date"; Date)
        {
        }
        field(14; "Late Bid (Opening Stage)"; Boolean)
        {
        }
        field(15; "Withdrawn Bid (Opening Stage)"; Code[50])
        {
        }
        field(16; "Withdrawal Notice No"; Code[50])
        {
        }
        field(17; "Succesful Bid (Opening Stage)"; Boolean)
        {
        }
        field(18; "Preliminary Evaluation Date"; Date)
        {
        }
        field(19; "Responsive Bid"; Boolean)
        {
            Caption = 'Responsive Bid (Preliminary Evaluation)';
            Description = 'Responsive Bid (Preliminary Evaluation)';
        }
        field(20; "Technical Evaluation Date"; Date)
        {
        }
        field(21; "Weighted Tech Score %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(22; "Passed Tech Evaluation"; Boolean)
        {
        }
        field(23; "Tech Evaluation Ranking"; Code[20])
        {
        }
        field(24; "Final Evaluated Bid Price"; Decimal)
        {
            Description = 'Final Evaluated Bid Price (I=F+G+H)';
        }
        field(25; "Financial Evaluation Date"; Date)
        {
        }
        field(26; "Weighted Financial Score %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(27; "Financial Evaluation Ranking"; Code[10])
        {
        }
        field(28; "Aggregate Weighted Score %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(29; "Aggregate Ranking"; Code[20])
        {
        }
        field(30; "Due Dilgence Date"; Date)
        {
        }
        field(31; "Due Diligence Rating"; Code[20])
        {
            Description = 'Due Diligence Assessment Rating';
        }
        field(32; "Professional Opion No."; Code[20])
        {
        }
        field(33; "Professional Opion Date"; Date)
        {
        }
        field(34; "Professional Opinion Outcome"; Option)
        {
            Description = 'Professional Opinion Outcome';
            OptionCaption = ',Succesful Bid,Unsuccesful Bid,Canceled Tender';
            OptionMembers = ,"Succesful Bid","Unsuccesful Bid","Canceled Tender";
        }
        field(35; "Corrected Bid Price (C=A+B)"; Decimal)
        {
        }
        field(36; "Unconditional Discount % (D)"; Decimal)
        {
        }
        field(37; "Unconditional Disc Amount (E)"; Decimal)
        {
            Caption = 'Unconditional Discount Amount (E)';
            Description = 'Unconditional Discount Amount (E)';
        }
        field(38; "Corrected & Disc Bid Price"; Decimal)
        {
            Caption = 'Corrected & Discounted Bid Price (F=C-E)';
            Description = 'Corrected & Discounted Bid Price (F=C-E)';
        }
        field(39; "Any Additional Adjustments (G)"; Decimal)
        {
        }
        field(40; "Any Priced Deviations (H))"; Decimal)
        {
        }
        field(41; "Financial Evaluation Comm Rem"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Financial Evaluation)';
            Description = 'Evaluation Committee Remarks (Financial Evaluation)';
        }
        field(42; "Evaluation Committee Recomm"; Option)
        {
            Description = 'Evaluation Committee Recommendation';
            OptionCaption = ',Awarded,Unsuccesful,Canceled,...';
            OptionMembers = ,Awarded,Unsuccesful,Canceled,"...";
        }
        field(43; "Read-out Bid Price (A)"; Decimal)
        {
        }
        field(44; "Arithmetic Corrections (B)"; Decimal)
        {
        }
        field(45; "Bid Opening Result"; Text[80])
        {
        }
        field(46; "Bid Opening Committee Remarks"; Text[100])
        {
        }
        field(47; "Preliminary Evaluation Reg"; Code[20])
        {
            Caption = 'Preliminary Evaluation Register No.';
            Description = 'Preliminary Evaluation Register No.';
        }
        field(49; "Preliminary Evaluation Outcome"; Text[80])
        {
        }
        field(50; "Preminary Evaluation Committee"; Text[100])
        {
            Caption = 'Evaluation Committee Remarks (Preminary Evaluation)';
            Description = 'Evaluation Committee Remarks (Preminary Evaluation)';
        }
        field(51; "Bid Opening Finance Register"; Code[20])
        {
            Caption = 'Bid Opening Register No.  (Financial)';
            Description = 'Bid Opening Register No.  (Financial)';
        }
        field(52; "Bid Opening Date (Financial)"; Date)
        {
        }
        field(53; "Financial Eval Register No"; Code[20])
        {
            Caption = 'Financial Evaluation Register No';
            Description = 'Financial Evaluation Register No';
        }
        field(54; "Vendor PIN"; Code[30])
        {
        }
        field(55; "Procurement Head Comments"; Text[250])
        {
        }
        field(56; "Due Diligence Report ID"; Option)
        {
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(57; "Bid Submission No"; Code[10])
        {
        }
        field(58; "Evaluation Committee Remarks"; Text[2000])
        {
        }
        field(59; Classification; Text[50])
        {
        }
        field(60; Manufacturer; Text[80])
        {
        }
        field(61; Country; Text[50])
        {
        }
        field(62; "AGPO Certficate Number"; Text[50])
        {
        }
        field(63; "AGPO Category"; Option)
        {
            OptionCaption = ' ,Women,Youth,PWD';
            OptionMembers = " ",Women,Youth,All;
        }
        field(64; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Tabulation ID", "Tabulation Type", "Document Type", "No.", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vend: Record Vendor;
}

