
page 69376 "Hand Over Item Lines"
{
    PageType = ListPart;
    SourceTable = "Hand over Item Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(LineNo; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;

                }

                field(ReceivedBy; Rec."Received By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Receieve)
            {
                ApplicationArea = Basic;
                Image = Return;
                Visible = false;

                trigger OnAction()
                begin
                    Rec.TestField("Return Date");
                    Rec."Received By" := UserId;
                    Rec."Received Date" := Today;
                    Rec.Receiveved := true;
                    Rec.Modify;
                    Message('Received successfully');
                end;
            }
        }
    }
}

#pragma implicitwith restore

