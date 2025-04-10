Table 52193423 "Member App Attachment Lines"
{
    DrillDownPageID = Attachments;
    LookupPageID = Attachments;

    fields
    {
        field(1; No; Code[20])
        {
            //TableRelation = "Member Applications"."No.";
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; Descriptions; Text[50])
        {
        }
        field(4; Attachment; Boolean)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; No, Descriptions)
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
    }

    var
        cashierr: Record Receipts;
        // LOAN: Record Loans;
        // type: Record "Loan Repayment Schedule";
        PostContributions: Codeunit "Receipt Management";
        cust: Record Customer;
        // LRSchedule: Record "Loan Repayment Schedule";
        Balance: Decimal;
        CashierRec: Record Receipts;
        PrincipleRepayAmnt: Decimal;
        InterestRepayAmnt: Decimal;
}

