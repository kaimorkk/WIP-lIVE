Page 51956 "SMS Broadcast Card1"
{
    PageType = Card;
    SourceTable = "SMS Broadcast";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.EntryNo)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(SMSMessage; Rec."SMS Message")
                {
                    ApplicationArea = Basic;
                }
            }
            // group(Recipients)
            // {
            //     Caption = 'Recipients';
            //     part(Control7; "SMS Receipients1")
            //     {
            //         SubPageLink = Code = field(Code);
            //         ApplicationArea = All;
            //     }
            // }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Employees")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                //RunObject = Report "Suggest SMS Patients";
            }
            separator(Action10)
            {
            }
            // action("Clear Recipients")
            // {
            //     ApplicationArea = Basic;
            //     Image = CancelAllLines;

            //     trigger OnAction()
            //     begin
            //         if Confirm('Do you really want to clear the recipients?') then begin
            //             SMSRece.Reset;
            //             SMSRece.SetRange(SMSRece.Code, Code);
            //             if SMSRece.Find('-') then SMSRece.DeleteAll;
            //         end;
            //     end;
            // }
            separator(Action12)
            {
            }
            // action("Post SMS")
            // {
            //     ApplicationArea = Basic;
            //     Image = Post;

            //     trigger OnAction()
            //     var
            //         smssender: Codeunit "SMS Integration Management";
            //     begin
            //         TestField("SMS Message");
            //         //TestField(Posted, false);
            //         if Confirm('Do you really want to post the messageto all recipents?') then begin
            //             SMSSend.Reset;
            //             if SMSSend.Find('+') then
            //                 Ln := SMSSend."Entry No";

            //             SMSRece.Reset;
            //             SMSRece.SetRange(SMSRece.Code, Code);
            //             if SMSRece.Find('-') then begin
            //                 repeat
            //                     Ln := Ln + 1;
            //                     SMSSend.Init;
            //                     SMSSend."Entry No" := Ln;
            //                     SMSSend."Phone No" := SMSRece."Phone No";
            //                     SMSSend.Message := "SMS Message";
            //                     SMSSend.Status := SMSSend.Status::Pending;
            //                     SMSSend.Date := Today;
            //                     SMSSend.Code := Code;
            //                     SMSSend.Insert;
            //                     smssender.SendSMS('254' + DelChr(SMSRece."Phone No", '<', '0'), "SMS Message");

            //                 until SMSRece.Next = 0;
            //             end;
            //             Posted := true;
            //             "Posted By" := UserId;
            //         end;
            //     end;
            // }
        }
    }

    var
        SMSRece: Record "SMS Receipients";
        SMSSend: Record "SMS Sender";
        Ln: Integer;
}

