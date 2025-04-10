
codeunit 52193433 "SMS Integration"
{

    trigger OnRun()
    begin
        //MESSAGE(FetchPendingSMS());
        //MESSAGE(FnInsertTransaction('OKHDJK2345','INVO24567','Steve Mutinda Mbisu','254727758318',200,25677));
        //FnSendSMSMessage('AP1001','AP1001','254727758318','This is SMS Integration Test Message by steve');
        //FnSendSMSMessage('AP1001','AP1001','254711549069','This is SMS Integration Test Message by Ruth');
        //MESSAGE(FnGetStudentExamResults('NAC/296668')); //ST00546437
        //MESSAGE(FnGetExamTimetable('NAC/296668')); //ATD/28431
    end;

    var
        SMSMessages: Record "SMS Messages";
        ExDutyGLAcc: label '01-0-0316';
        iEntryNo: Integer;

    procedure FetchPendingSMS() MessageDetails: Text[500]
    begin

        SMSMessages.Reset;
        SMSMessages.SetRange(SMSMessages."Sent To Server", SMSMessages."sent to server"::No);
        if SMSMessages.Find('-') then begin

            if (SMSMessages."Telephone No" = '') or (SMSMessages."Telephone No" = '+') or (SMSMessages."SMS Message" = '') then begin
                SMSMessages."Sent To Server" := SMSMessages."sent to server"::Failed;
                SMSMessages."Sent To Server Status" := 'FAILED';
                SMSMessages.Modify;
            end
            else begin
                MessageDetails := SMSMessages."Telephone No" + '*' + SMSMessages."SMS Message" + SMSMessages."Additional Message" + '*' + Format(SMSMessages."Entry No") + '*' + SMSMessages."Entered By";
            end;
        end;
    end;

    procedure ConfirmSent(entryno: Integer; messageid: Text)
    begin

        begin
            SMSMessages.Reset;
            SMSMessages.SetRange(SMSMessages."Sent To Server", SMSMessages."sent to server"::No);
            SMSMessages.SetRange(SMSMessages."Entry No", entryno);
            if SMSMessages.FindFirst then begin
                SMSMessages.MessageID := messageid;
                SMSMessages."Sent To Server" := SMSMessages."sent to server"::Yes;
                SMSMessages."Date Sent to Server" := CurrentDatetime;
                SMSMessages."Time Sent To Server" := Time;
                SMSMessages."Sent To Server Status" := 'SUCCESS';
                SMSMessages."Delivery Status" := 'Delivery Assumed';
                SMSMessages.Modify;

            end
        end;
    end;

    procedure UpdateDeliveryStatus(tranID: Integer; messageID: Text; deliverystatus: Text; deliverytat: Text; deliverynetworkid: Text; deliverytime: DateTime; deliverydescription: Text) result: Code[50]
    begin
        SMSMessages.Reset;
        SMSMessages.SetRange(SMSMessages."Entry No", tranID);
        SMSMessages.SetRange(SMSMessages.MessageID, messageID);
        if SMSMessages.Find('-') then begin
            SMSMessages.MessageID := messageID;
            //SMSMessages."Bulk SMS Balance":=Balance;
            //SMSMessages.Fetched:=status;
            SMSMessages.DeliveredOn := deliverytime;
            SMSMessages."Delivery Status" := deliverydescription;
            if SMSMessages.Modify = true then
                result := 'TRUE'
            else
                result := 'FALSE';
        end;
    end;


    procedure FnSendSMSMessage(documentNo: Text[30]; accountno: Text[30]; phone: Text[20]; message: Text[250])
    begin

        SMSMessages.Reset;
        if SMSMessages.Find('+') then begin
            iEntryNo := SMSMessages."Entry No";
            iEntryNo := iEntryNo + 1;
        end
        else begin
            iEntryNo := 1;
        end;
        SMSMessages.Init;
        SMSMessages."Entry No" := iEntryNo;
        SMSMessages."Batch No" := documentNo;
        SMSMessages."Document No" := documentNo;
        SMSMessages."Account No" := accountno;
        SMSMessages."Date Entered" := Today;
        SMSMessages."Time Entered" := Time;
        SMSMessages.Source := 'SYSTEM';
        SMSMessages."Entered By" := UserId;
        SMSMessages."Sent To Server" := SMSMessages."sent to server"::No;
        SMSMessages."SMS Message" := message;
        SMSMessages."Telephone No" := phone;
        if SMSMessages."Telephone No" <> '' then
            SMSMessages.Insert;
    end;

    // procedure FnGetStudentExamResults(var Results: BigText; studentno: Code[50])
    // var
    //     StudentExamResult: Record "Examination Results";
    // begin
    //     StudentExamResult.Reset;
    //     StudentExamResult.SetRange("Student Reg No.", studentno);
    //     if StudentExamResult.FindSet then begin
    //         repeat

    //             Results.AddText('::::' + StudentExamResult."Examination Sitting ID" + '*' + StudentExamResult.Examination + '*' + StudentExamResult.Paper + '*' + StudentExamResult."Paper Name" + '*' + StudentExamResult.Grade);
    //         until StudentExamResult.Next = 0
    //     end else begin
    //         // Results:='Sorry, no Results found for your Registration Number ';
    //     end
    // end;

    // procedure FnGetExamTimetable(var Results: BigText; studentno: Code[50])
    // var
    //     ExamSittingCycle: Record "Exam Sitting Cycle";
    //     ExamBookingLines: Record "Student Processing Lines";
    //     StudentProcessingHeader: Record "Student Processing Header";
    //     TimetablePlanningHeader: Record "Timetable Planner Header";
    //     TimetablePlanningLines: Record "Timetable Planner Lines";
    // begin
    //     ExamSittingCycle.Reset;
    //     ExamSittingCycle.SetRange(Closed, true);
    //     if ExamSittingCycle.FindLast then begin
    //         StudentProcessingHeader.Reset;
    //         StudentProcessingHeader.SetRange("Student Reg. No.", studentno);
    //         StudentProcessingHeader.SetRange("Examination Sitting", ExamSittingCycle."Exam Sitting Cycle");
    //         if StudentProcessingHeader.FindSet then begin
    //             ExamBookingLines.Reset;
    //             ExamBookingLines.SetRange("Booking Header No.", StudentProcessingHeader."No.");
    //             if ExamBookingLines.FindSet then begin
    //                 repeat
    //                     TimetablePlanningHeader.Reset;
    //                     TimetablePlanningHeader.SetRange("Exam Sitting ID", StudentProcessingHeader."Examination Sitting");
    //                     if TimetablePlanningHeader.FindSet then begin
    //                         TimetablePlanningLines.Reset;
    //                         TimetablePlanningLines.SetRange(Code, TimetablePlanningHeader.Code);
    //                         TimetablePlanningLines.SetRange(Paper, ExamBookingLines.Paper);
    //                         if TimetablePlanningLines.FindSet then begin
    //                             Results.AddText(':::' + StudentProcessingHeader."Examination Sitting" + '*' + StudentProcessingHeader."Examination ID" + '*' + StudentProcessingHeader."Examination Center"
    //                             + '*' + TimetablePlanningLines.Paper + '*' + TimetablePlanningLines.Description + '*' + TimetablePlanningLines.Day + '*' + Format(TimetablePlanningLines.Date)
    //                               + '*' + Format(TimetablePlanningLines."Start Time") + '*' + Format(TimetablePlanningLines."End Time") + '*' + Format(TimetablePlanningLines."Exam Duration"));
    //                         end else begin
    //                         end;

    //                     end else begin
    //                     end
    //                 until ExamBookingLines.Next = 0
    //             end else begin
    //             end;
    //         end else begin
    //             // Results:='Sorry, no Results found for your Registration Number ';
    //         end;
    //     end else begin
    //     end
    // end;

    // procedure FnGetRenewalStatus(var Results: BigText; studentno: Code[50])
    // var
    //     ExaminationAccount: Record "Examination Account";
    // begin
    //     ExaminationAccount.Reset;
    //     ExaminationAccount.SetRange("Registration No.", studentno);
    //     ExaminationAccount.SetFilter("Renewal Pending", '>', 0);
    //     if ExaminationAccount.FindSet then begin
    //         repeat

    //             Results.AddText('::::' + ExaminationAccount."Course ID" + '*' + ExaminationAccount."Course Description" + '*' +
    //            Format(ExaminationAccount."Renewal Amount" + ExaminationAccount."Re-Activation Amount") + '*' + Format(ExaminationAccount."Renewal Pending") + '*' + Format(ExaminationAccount.Status));

    //         until ExaminationAccount.Next = 0
    //     end else begin
    //         // Results:='Sorry, no Results found for your Registration Number ';
    //     end
    // end;

    // procedure FnVerifyExamBooking(var Results: BigText; studentno: Code[50])
    // var
    //     ExamSittingCycle: Record "Exam Sitting Cycle";
    //     StudentProcessingHeader: Record "Student Processing Header";
    // begin
    //     ExamSittingCycle.Reset;
    //     ExamSittingCycle.SetRange(Closed, true);
    //     if ExamSittingCycle.FindLast then begin
    //         StudentProcessingHeader.Reset;
    //         StudentProcessingHeader.SetRange("Student Reg. No.", studentno);
    //         StudentProcessingHeader.SetRange("Examination Sitting", ExamSittingCycle."Exam Sitting Cycle");
    //         if StudentProcessingHeader.FindSet then begin
    //             Results.AddText(':::' + StudentProcessingHeader."Examination Sitting" + '*' + StudentProcessingHeader."Examination ID" + '*' + StudentProcessingHeader."Examination Center");
    //         end else begin
    //         end;

    //     end else begin
    //         // Results:='Sorry, no Results found for your Registration Number ';
    //     end;
    // end;
}

