

page 69229 "Training Participants List"
{
    PageType = ListPart;
    SourceTable = "Training Participants1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee No.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Caption = 'Type of Expense';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Amount"; Rec."Unit Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Amount field.', Comment = '%';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                }
                field("Training Responsibility"; Rec."Training Responsibility")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Region';
                    Visible = false;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Training Code"; Rec."Training Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Training Responsibility Code"; Rec."Training Responsibility Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Charge Levy"; Rec."Charge Levy")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Charge Levy field.';
                    Visible = false;
                }

                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Header.Reset();
        Header.SetRange(Code, Rec."Training Code");
        if Header.FindFirst() then
            Rec.Requestor := Header."Employee Name";
        Rec."Training Responsibility Code" := Header."Global Dimension 1 Code";
        Rec."Bond Penalty" := Header."Bond Penalty";
        Rec."Bond End Date" := Header."Expected Bond End";
    end;

    var
        Header: Record "Training Requests";
}

#pragma implicitwith restore


