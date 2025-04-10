Page 52193951 "Account Event Option Box"
{
    PageType = Card;

    layout
    {
        area(content)
        {
            label(MessageTextBox)
            {
                ApplicationArea = Basic;
                CaptionClass = FORMAT(MessageText);
                MultiLine = true;
            }
            field(ReasonText; ReasonText)
            {
                ApplicationArea = Basic;
                Caption = 'Reason';
            }
            field(Comments; Comments)
            {
                ApplicationArea = Basic;
                Caption = 'Other Details';
            }
        }
    }

    actions
    {
    }

    trigger OnQueryClosePage(CloseAction: action): Boolean
    begin
        if CloseAction = Action::No then
            NoOnPush;
        if CloseAction = Action::Yes then
            YesOnPush;
    end;

    var
        MessageText: Text[250];
        ResultEvent: Boolean;
        ReasonText: Text[100];
        CareerHistory: Record "HR Career History1";
        ResultReason: Text[100];
        Comments: Text[250];
        OtherDetails: Text[250];


    procedure SetMessage(Message: Text[200])
    begin
        MessageText := 'Do you wish to create an account event, called %1 ?';
        MessageText := StrSubstNo(MessageText, Message);
    end;


    procedure ReturnResult() Result: Boolean
    begin
        Result := ResultEvent;
    end;


    procedure ReturnReason() ReturnReason: Text[100]
    begin
        ReturnReason := ReasonText;
    end;

    local procedure YesOnPush()
    begin
        ResultEvent := true;
    end;

    local procedure NoOnPush()
    begin
        ResultEvent := false;
    end;


    procedure ReturnComments() OtherDetails: Text[250]
    begin
        OtherDetails := Comments;
    end;
}

