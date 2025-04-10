

page 70075 "Technica Evaluation Checklist"
{
    PageType = List;
    SourceTable = "RFQ Evaluation Lists";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("RFP No."; Rec."RFP No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Maximum Score"; Rec."Maximum Score")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Evaluation Type" := Rec."evaluation type"::Technical;
    end;
}

#pragma implicitwith restore

