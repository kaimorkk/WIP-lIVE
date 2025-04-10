
table 70217 "Finance Evaluation Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document ID"; Code[20])
        {
            TableRelation = "Bid Evaluation Register".Code;
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
        field(24; "Read-out Bid Price (A)"; Decimal)
        {
            Description = 'Final Evaluated Bid Price (I=F+G+H)';

            trigger OnValidate()
            begin

                "Final Evaluated Bid Price" := "Read-out Bid Price (A)";
            end;
        }
        field(25; "Financial Evaluation Date"; Date)
        {
        }
        field(26; "Weighted Financial Score %"; Decimal)
        {
            MaxValue = 20;
            MinValue = 0;
        }
        field(27; "Financial Evaluation Ranking"; Code[20])
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
        field(30; "Arithmetic Corrections (B)"; Decimal)
        {

            trigger OnValidate()
            begin
                "Corrected Bid Price" := "Read-out Bid Price (A)" + "Arithmetic Corrections (B)";
                "Final Evaluated Bid Price" := "Corrected Bid Price";
            end;
        }
        field(31; "Corrected Bid Price"; Decimal)
        {
            Editable = false;
        }
        field(32; "Final Evaluated Bid Price"; Decimal)
        {
        }
        field(33; "Evaluation Committee Remarks"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Financial Evaluation)';
        }
        field(34; "Evaluation Committee Recomm"; Option)
        {
            Description = 'Evaluation Committee Recommendation';
            OptionCaption = ',Award,Unsuccesful,...';
            OptionMembers = ,Award,Unsuccesful,"...";
        }
        field(35; "Final Tender Outcome"; Option)
        {
            OptionCaption = ',Awarded,Unsuccesful,Canceled';
            OptionMembers = ,Awarded,Unsuccesful,Canceled;
        }
        field(59; "Unconditional Discount % (D)"; Decimal)
        {
        }
        field(60; "Unconditional Disc Amount (E)"; Decimal)
        {
            Caption = 'Unconditional Discount Amount (E)';
            Description = 'Unconditional Discount Amount (E)';
        }
        field(61; "Corrected & Disc Bid Price"; Decimal)
        {
            Caption = 'Corrected & Discounted Bid Price (F=C-E)';
            Description = 'Corrected & Discounted Bid Price (F=C-E)';
        }
        field(62; "Any Additional Adjustments (G)"; Decimal)
        {
        }
        field(63; "Any Priced Deviations (H))"; Decimal)
        {
        }
        field(64; "Finacial Auto-Ranking"; Integer)
        {
        }
        field(65; Ranking; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(66; "Market Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(67; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Document ID", "Document Type", "No.", "Line No.")
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

