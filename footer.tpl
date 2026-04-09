                    {if $templatefile != 'homepage'}
                    </div>
                    </div>
                    {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                        <div class="d-lg-none sidebar sidebar-secondary">
                            {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                        </div>
                    {/if}
                <div class="clearfix"></div>
            </div>
        </div>
        {/if}
    </section>

    <footer id="footer" class="footer">
        <div class="container">
            <div class="liga-footer-grid">
                <div>
                    {if $assetLogoPath}
                        <img src="{$assetLogoPath}" alt="{$companyname}" style="max-height:34px;margin-bottom:14px;">
                    {else}
                        <h4 style="color:#fff;margin-bottom:14px;">{$companyname}</h4>
                    {/if}
                    <p style="color:#8892a4;font-size:0.87rem;line-height:1.7;max-width:280px;">
                        Enterprise-grade cloud infrastructure with global reach. Powering businesses with reliable, high-performance servers since 2019.
                    </p>
                    <div class="liga-social">
                        {include file="$template/includes/social-accounts.tpl"}
                    </div>
                </div>
                <div>
                    <h5>Solutions</h5>
                    <ul>
                        <li><a href="{$WEB_ROOT}/cart.php">VPS Hosting</a></li>
                        <li><a href="{$WEB_ROOT}/cart.php">Web Hosting</a></li>
                        <li><a href="{$WEB_ROOT}/cart.php">Game Hosting</a></li>
                    </ul>
                </div>
                <div>
                    <h5>Company</h5>
                    <ul>
                        <li><a href="{routePath('announcement-index')}">{lang key='announcementstitle'}</a></li>
                        <li><a href="{routePath('knowledgebase-index')}">{lang key='knowledgebasetitle'}</a></li>
                        <li><a href="serverstatus.php">{lang key='networkstatustitle'}</a></li>
                        <li><a href="{$WEB_ROOT}/contact.php">{lang key='contactus'}</a></li>
                    </ul>
                </div>
                <div>
                    <h5>Support</h5>
                    <div style="background:#0d1730;border:1px solid #1a2744;border-radius:10px;padding:14px;margin-bottom:10px;">
                        <div style="display:flex;align-items:center;gap:9px;margin-bottom:9px;">
                            <div style="width:30px;height:30px;border-radius:8px;background:rgba(124,58,237,0.15);display:flex;align-items:center;justify-content:center;color:#a78bfa;"><i class="fas fa-headset"></i></div>
                            <div>
                                <div style="font-weight:700;font-size:0.82rem;color:#fff;">24/7 Technical Support</div>
                                <div style="font-size:0.72rem;color:#8892a4;">Expert engineers always ready</div>
                            </div>
                        </div>
                        <a href="submitticket.php" class="btn btn-outline-primary btn-sm btn-block" style="border-radius:8px;">
                            {lang key='homepage.submitTicket' default='Open Support Ticket'}
                        </a>
                    </div>
                </div>
            </div>

            <div class="liga-footer-bottom">
                <div class="foot-item"><i class="fas fa-shield-alt"></i> 256-bit SSL Encryption</div>
                <div class="foot-item"><i class="fas fa-server"></i> Tier 3+ Data Centers</div>
                <div class="foot-item"><i class="fas fa-clock"></i> 99.9% Uptime SLA</div>
                <div class="foot-item"><i class="fas fa-headset"></i> 24/7 Expert Support</div>
            </div>

            <div class="text-center" style="padding-top:14px;font-size:0.78rem;color:#8892a4;opacity:0.6;">
                {if $acceptTOS}<a href="{$tosURL}" target="_blank" style="color:#8892a4;margin-right:14px;">{lang key='ordertos'}</a>{/if}
                {lang key="copyrightFooterNotice" year=$date_year company=$companyname}
            </div>

            {if $languagechangeenabled && count($locales) > 1 || $currencies}
                <div class="text-center mt-3">
                    <button type="button" class="btn btn-sm btn-outline-light" data-toggle="modal" data-target="#modalChooseLanguage">
                        <div class="d-inline-block align-middle">
                            <div class="iti-flag {if $activeLocale.countryCode === '001'}us{else}{$activeLocale.countryCode|lower}{/if}"></div>
                        </div>
                        {$activeLocale.localisedName} / {$activeCurrency.prefix}{$activeCurrency.code}
                    </button>
                </div>
            {/if}
        </div>
    </footer>

    <div id="fullpage-overlay" class="w-hidden">
        <div class="outer-wrapper"><div class="inner-wrapper">
            <img src="{$WEB_ROOT}/assets/img/overlay-spinner.svg" alt=""><br><span class="msg"></span>
        </div></div>
    </div>

    <div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog"><div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">{lang key='loading'}</div>
            <div class="modal-footer">
                <div class="float-left loader"><i class="fas fa-circle-notch fa-spin"></i> {lang key='loading'}</div>
                <button type="button" class="btn btn-default" data-dismiss="modal">{lang key='close'}</button>
                <button type="button" class="btn btn-primary modal-submit">{lang key='submit'}</button>
            </div>
        </div></div>
    </div>

    <form method="get" action="{$currentpagelinkback}">
        <div class="modal modal-localisation" id="modalChooseLanguage" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-body">
                <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                {if $languagechangeenabled && count($locales) > 1}
                    <h5 class="h5 pt-5 pb-3">{lang key='chooselanguage'}</h5>
                    <div class="row item-selector">
                        <input type="hidden" name="language" data-current="{$language}" value="{$language}" />
                        {foreach $locales as $locale}
                            <div class="col-4"><a href="#" class="item{if $language == $locale.language} active{/if}" data-value="{$locale.language}">{$locale.localisedName}</a></div>
                        {/foreach}
                    </div>
                {/if}
                {if !$loggedin && $currencies}
                    <p class="h5 pt-5 pb-3">{lang key='choosecurrency'}</p>
                    <div class="row item-selector">
                        <input type="hidden" name="currency" data-current="{$activeCurrency.id}" value="">
                        {foreach $currencies as $selectCurrency}
                            <div class="col-4"><a href="#" class="item{if $activeCurrency.id == $selectCurrency.id} active{/if}" data-value="{$selectCurrency.id}">{$selectCurrency.prefix} {$selectCurrency.code}</a></div>
                        {/foreach}
                    </div>
                {/if}
            </div>
            <div class="modal-footer"><button type="submit" class="btn btn-default">{lang key='apply'}</button></div>
            </div></div>
        </div>
    </form>

    {if !$loggedin && $adminLoggedIn}
        <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="btn btn-return-to-admin" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{lang key='adminmasqueradingasclient'} {lang key='logoutandreturntoadminarea'}{else}{lang key='adminloggedin'} {lang key='returntoadminarea'}{/if}">
            <i class="fas fa-redo-alt"></i>
            <span class="d-none d-md-inline-block">{lang key="admin.returnToAdmin"}</span>
        </a>
    {/if}

    {include file="$template/includes/generate-password.tpl"}
    {$footeroutput}
</body>
</html>
