table 50101 "Budget Comment"
{
    Caption = 'Budget Comment';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry ID"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = True;
            Editable = False;
        }
        field(2; "Record Id"; RecordId)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
            ValidateTableRelation = false;
            Editable = False;
        }

        field(4; "Comment"; Blob)
        {
            SubType = Memo;
        }
        field(5; "Comment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Review,JSC;
        }
    }
    keys
    {
        key(PK; "Record Id", "Entry ID")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "User ID" := UserId;
    end;

    procedure ShowComments(RecID: RecordId; CanEdit: Boolean)
    var
        BudgetCommentRec: Record "Budget Comment";
        BudgetComments: page "Budget Comments";
    begin
        BudgetCommentRec.Reset();
        BudgetCommentRec.SetRange("Record Id", RecID);
        BudgetCommentRec.SetRange("Comment Type", BudgetCommentRec."Comment Type"::Review);

        clear(BudgetComments);
        BudgetComments.SetTableView(BudgetCommentRec);
        BudgetComments.setCanEdit(CanEdit);
        BudgetComments.Run();
    end;

    procedure ShowJSCComments(RecID: RecordId; CanEdit: Boolean)
    var
        BudgetCommentRec: Record "Budget Comment";
        // BudgetComments: page "JSC Comments";
    begin
        BudgetCommentRec.Reset();
        BudgetCommentRec.SetRange("Record Id", RecID);
        BudgetCommentRec.SetRange("Comment Type", BudgetCommentRec."Comment Type"::JSC);

        // clear(BudgetComments);
        // BudgetComments.SetTableView(BudgetCommentRec);
        // BudgetComments.setCanEdit(CanEdit);
        // BudgetComments.Run();
    end;

}
