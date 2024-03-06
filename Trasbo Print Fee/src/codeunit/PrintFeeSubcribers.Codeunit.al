codeunit 55000 "Print Fee Subcribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeReleaseSalesDoc, '', false, false)]
    local procedure OnBeforeReleaseSalesDocHandlePrintFee(PreviewMode: Boolean; var SalesHeader: Record "Sales Header"; var SkipCheckReleaseRestrictions: Boolean)
    var
        Customer: Record Customer;
        SalesLine: Record "Sales Line";
        SalesSetup: Record "Sales & Receivables Setup";
        PrintFeeMgt: Codeunit "Print Fee Mgt.";
        LastLineNo: Integer;
    begin
        if PreviewMode then
            exit;
        Customer := SalesHeader.GetCust(SalesHeader."Sell-to Customer No.");
        SalesSetup.get();

        if customer."CDO Send Code" = SalesSetup."Print Fee Output Profile" then begin
            if PrintFeeMgt.HasPrintFeeLine(SalesHeader, SalesLine, SalesSetup) then
                PrintFeeMgt.DeletePrintFeeLines(SalesLine);

            LastLineNo := PrintFeeMgt.GetLastLineNo(SalesHeader);

            PrintFeeMgt.AddPrintFeeGLLine(SalesHeader, SalesSetup, LastLineNo);

            LastLineNo := PrintFeeMgt.GetLastLineNo(SalesHeader);

            PrintFeeMgt.AddPrintFeeCommentLine(SalesHeader, SalesSetup, LastLineNo);
        end;


    end;
}