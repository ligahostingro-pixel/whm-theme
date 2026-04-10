<!-- ── Hero Section ── -->
<section class="liga-hero">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 hero-content">
                <div class="hero-status">
                    <span class="dot"></span>
                    {lang key='networkstatustitle' default='All Systems Operational'}&nbsp;&middot;&nbsp;99.9% SLA
                </div>
                <h1>Deploy Cloud<br>Infrastructure<br><span class="accent">That Never Sleeps</span></h1>
                <p class="hero-desc">
                    High-performance VPS and Web Hosting on enterprise hardware.
                    Instant provisioning, 1 Gbps+ network, multi-layered DDoS protection.
                    From <strong>&euro;2/mo</strong>.
                </p>
                <div class="hero-buttons">
                    <a href="{$WEB_ROOT}/register.php" class="btn-hero-primary">
                        <i class="fas fa-rocket"></i> Get Started Free
                    </a>
                    <a href="{$WEB_ROOT}/cart.php" class="btn-hero-secondary">
                        <i class="fas fa-server"></i> View Plans
                    </a>
                </div>
            </div>
            <div class="col-lg-6 mt-4 mt-lg-0">
                <div style="position:relative;">
                    <div class="liga-terminal">
                        <div class="terminal-bar">
                            <span class="terminal-dot red"></span>
                            <span class="terminal-dot yellow"></span>
                            <span class="terminal-dot green"></span>
                            <span class="terminal-title">root@liga ~ $</span>
                        </div>
                        <div class="terminal-body">
                            <div class="line"><span class="prompt">$ </span><span class="cmd">curl -s https://api.ligahosting.com/deploy</span></div>
                            <div class="line"><span class="info">[info] Provisioning VPS-4000...</span></div>
                            <div class="line"><span class="info">[info] Allocating 4 vCPU, 8GB RAM</span></div>
                            <div class="line"><span class="info">[info] Mounting 160GB NVMe</span></div>
                            <div class="line"><span class="done">[done] Server online in 23s</span></div>
                            <div class="line"><span class="prompt">$ </span><span class="cmd" style="border-right:2px solid var(--liga-cyan);animation:blink 1s step-end infinite;">_</span></div>
                        </div>
                    </div>
                    <div class="liga-float-badge float-ddos">
                        <div class="badge-icon purple"><i class="fas fa-shield-alt"></i></div>
                        <div><div class="badge-label">DDoS Protected</div><div class="badge-sub">1 Tbps Mitigation</div></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ── Domain Search (WHMCS native, moved after hero) ── -->
{if $registerdomainenabled || $transferdomainenabled}
    {include file="$template/includes/domain-search.tpl"}
{/if}

<!-- ── Icon Strip ── -->
<div class="container">
    <div class="liga-icon-strip">
        <div class="strip-item"><i class="fas fa-shield-alt"></i> DDoS Protected</div>
        <div class="strip-item"><i class="fas fa-bolt"></i> NVMe Storage</div>
        <div class="strip-item"><i class="fas fa-microchip"></i> AMD EPYC</div>
        <div class="strip-item"><i class="fas fa-check-circle"></i> Instant Setup</div>
        <div class="strip-item"><i class="fas fa-headset"></i> 24/7 Support</div>
        <div class="strip-item"><i class="fas fa-cloud-download-alt"></i> Free Backups</div>
    </div>
</div>

<!-- ── Features ── -->
<section class="liga-features">
    <div class="container">
        <div class="section-label">
            <h2>Enterprise Power, Simple Experience</h2>
            <p>Every feature you need to run production workloads with confidence</p>
        </div>
        <div class="row d-flex">
            <div class="col-lg-8 mb-4 d-flex">
                <div class="liga-feature-card">
                    <div class="feature-icon purple"><i class="fas fa-shield-alt"></i></div>
                    <h4>Advanced DDoS Protection</h4>
                    <p>Multi-layered filtering powered by Path.net with up to 1 Tbps mitigation capacity. Always-on detection with automatic real-time response. Zero impact on legitimate traffic.</p>
                    <div class="liga-traffic-bar">
                        <div class="bar-row"><div class="bar-track"><div class="bar-fill legit"></div></div><span class="bar-label">Legitimate</span></div>
                        <div class="bar-row"><div class="bar-track"><div class="bar-fill filtered"></div></div><span class="bar-label">Filtered</span></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4 d-flex">
                <div class="liga-feature-card">
                    <div class="feature-icon cyan"><i class="fas fa-bolt"></i></div>
                    <h4>Instant Deploy</h4>
                    <p>Choose your OS, click deploy. Your server is live in under 60 seconds with full root access.</p>
                </div>
            </div>
            <div class="col-lg-4 mb-4 d-flex">
                <div class="liga-feature-card">
                    <div class="feature-icon blue"><i class="fas fa-network-wired"></i></div>
                    <h4>Premium Network</h4>
                    <p>Tier 1 carriers, up to 40 Gbps uplinks, ultra-low latency. BGP peering with major European and US exchanges.</p>
                </div>
            </div>
            <div class="col-lg-4 mb-4 d-flex">
                <div class="liga-feature-card">
                    <div class="feature-icon amber"><i class="fas fa-server"></i></div>
                    <h4>Enterprise Hardware</h4>
                    <p>AMD EPYC 7702P and Intel Xeon Platinum 8180. Samsung PM9A3 NVMe and enterprise SSDs.</p>
                </div>
            </div>
            <div class="col-lg-4 mb-4 d-flex">
                <div class="liga-feature-card">
                    <div class="feature-icon green"><i class="fas fa-headset"></i></div>
                    <h4>24/7 Expert Support</h4>
                    <p>Real engineers, not chatbots. Average response under 15 minutes.</p>
                    <div class="liga-stats">
                        <div><div class="stat-val">&lt;15min</div><div class="stat-label">Avg Response</div></div>
                        <div><div class="stat-val">99.9%</div><div class="stat-label">Resolution</div></div>
                        <div><div class="stat-val">24/7</div><div class="stat-label">Availability</div></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ── Datacenters ── -->
<section class="liga-datacenters">
    <div class="container">
        <div class="text-center mb-4">
            <div class="section-badge"><i class="fas fa-globe"></i> Infrastructure</div>
            <h2>Global Datacenter Network</h2>
            <p style="color:#8892a4;">4 locations across 3 continents for low-latency access worldwide</p>
        </div>
        <div class="row d-flex">
            <div class="col-md-6 col-lg-3 mb-4 d-flex">
                <div class="liga-dc-card">
                    <div class="dc-header"><div class="dc-flag">RO</div><div><div class="dc-name">Tulcea, Romania</div><div class="dc-status"><span class="dot"></span> Online</div></div></div>
                    <div class="dc-specs">
                        <div class="spec"><i class="fas fa-microchip"></i> 2x Xeon Platinum 8180</div>
                        <div class="spec"><i class="fas fa-hdd"></i> NVMe SSD</div>
                        <div class="spec"><i class="fas fa-tachometer-alt"></i> 10 Gbps Uplink</div>
                        <div class="spec"><i class="fas fa-server"></i> VPS</div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4 d-flex">
                <div class="liga-dc-card">
                    <div class="dc-header"><div class="dc-flag">DE</div><div><div class="dc-name">Frankfurt, Germany</div><div class="dc-status"><span class="dot"></span> Online</div></div></div>
                    <div class="dc-specs">
                        <div class="spec"><i class="fas fa-microchip"></i> AMD EPYC 7702P</div>
                        <div class="spec"><i class="fas fa-hdd"></i> Samsung PM9A3</div>
                        <div class="spec"><i class="fas fa-tachometer-alt"></i> 40 Gbps Uplink</div>
                        <div class="spec"><i class="fas fa-server"></i> VPS &middot; Web Hosting</div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4 d-flex">
                <div class="liga-dc-card">
                    <div class="dc-header"><div class="dc-flag">NL</div><div><div class="dc-name">Amsterdam, Netherlands</div><div class="dc-status"><span class="dot"></span> Online</div></div></div>
                    <div class="dc-specs">
                        <div class="spec"><i class="fas fa-microchip"></i> AMD EPYC 7702P</div>
                        <div class="spec"><i class="fas fa-hdd"></i> Samsung PM9A3</div>
                        <div class="spec"><i class="fas fa-tachometer-alt"></i> 40 Gbps Uplink</div>
                        <div class="spec"><i class="fas fa-server"></i> VPS</div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4 d-flex">
                <div class="liga-dc-card">
                    <div class="dc-header"><div class="dc-flag">US</div><div><div class="dc-name">Los Angeles, USA</div><div class="dc-status"><span class="dot"></span> Online</div></div></div>
                    <div class="dc-specs">
                        <div class="spec"><i class="fas fa-microchip"></i> 2x Xeon E5-2699 v4</div>
                        <div class="spec"><i class="fas fa-hdd"></i> NVMe SSD</div>
                        <div class="spec"><i class="fas fa-tachometer-alt"></i> 10 Gbps Uplink</div>
                        <div class="spec"><i class="fas fa-server"></i> VPS</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ── Products (WHMCS dynamic) ── -->
{if !empty($productGroups) || $registerdomainenabled || $transferdomainenabled}
    <section class="liga-features">
        <div class="container">
            <div class="section-label"><h2>{lang key='clientHomePanels.productsAndServices'}</h2></div>
            <div class="row justify-content-center">
                {foreach $productGroups as $productGroup}
                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="liga-feature-card text-center" style="display:flex;flex-direction:column;align-items:center;">
                            <div class="feature-icon purple"><i class="fas fa-cube"></i></div>
                            <h4>{$productGroup->name}</h4>
                            <p>{$productGroup->tagline}</p>
                            <a href="{$productGroup->getRoutePath()}" class="btn btn-outline-primary btn-block mt-auto">{lang key='browseProducts'}</a>
                        </div>
                    </div>
                {/foreach}
                {if $registerdomainenabled}
                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="liga-feature-card text-center" style="display:flex;flex-direction:column;align-items:center;">
                            <div class="feature-icon cyan"><i class="fas fa-globe"></i></div>
                            <h4>{lang key='orderregisterdomain'}</h4>
                            <p>{lang key='secureYourDomain'}</p>
                            <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="btn btn-outline-primary btn-block mt-auto">{lang key='navdomainsearch'}</a>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </section>
{/if}

<!-- ── How Can We Help (WHMCS native) ── -->
<section style="padding:50px 0;">
    <div class="container">
        <h2 class="text-center mb-4">{lang key='howCanWeHelp'}</h2>
        <div class="row my-4 action-icon-btns">
            <div class="col-6 col-md-4 col-lg">
                <a href="{routePath('announcement-index')}"><figure class="ico-container"><i class="fal fa-bullhorn"></i></figure>{lang key='announcementstitle'}</a>
            </div>
            <div class="col-6 col-md-4 col-lg">
                <a href="serverstatus.php"><figure class="ico-container"><i class="fal fa-server"></i></figure>{lang key='networkstatustitle'}</a>
            </div>
            <div class="col-6 col-md-4 col-lg">
                <a href="{routePath('knowledgebase-index')}"><figure class="ico-container"><i class="fal fa-book"></i></figure>{lang key='knowledgebasetitle'}</a>
            </div>
            <div class="col-6 col-md-4 offset-md-2 offset-lg-0 col-lg">
                <a href="{routePath('download-index')}"><figure class="ico-container"><i class="fal fa-download"></i></figure>{lang key='downloadstitle'}</a>
            </div>
            <div class="col-6 offset-3 offset-md-0 col-md-4 col-lg">
                <a href="submitticket.php"><figure class="ico-container"><i class="fal fa-life-ring"></i></figure>{lang key='homepage.submitTicket'}</a>
            </div>
        </div>
    </div>
</section>

<!-- ── Your Account (WHMCS native) ── -->
<section style="padding:50px 0; background:#060b18;">
    <div class="container">
        <h2 class="text-center mb-4">{lang key='homepage.yourAccount'}</h2>
        <div class="row my-4 action-icon-btns">
            <div class="col-6 col-md-4 col-lg">
                <a href="clientarea.php"><figure class="ico-container"><i class="fal fa-home"></i></figure>{lang key='homepage.yourAccount'}</a>
            </div>
            <div class="col-6 col-md-4 col-lg">
                <a href="clientarea.php?action=services"><figure class="ico-container"><i class="far fa-cubes"></i></figure>{lang key='homepage.manageServices'}</a>
            </div>
            {if $registerdomainenabled || $transferdomainenabled || $numberOfDomains}
                <div class="col-6 col-md-4 col-lg">
                    <a href="clientarea.php?action=domains"><figure class="ico-container"><i class="fal fa-globe"></i></figure>{lang key='homepage.manageDomains'}</a>
                </div>
            {/if}
            <div class="col-6 col-md-4 offset-md-2 offset-lg-0 col-lg">
                <a href="supporttickets.php"><figure class="ico-container"><i class="fal fa-comments"></i></figure>{lang key='homepage.supportRequests'}</a>
            </div>
            <div class="col-6 offset-3 offset-md-0 col-md-4 col-lg">
                <a href="clientarea.php?action=masspay&all=true"><figure class="ico-container"><i class="fal fa-credit-card"></i></figure>{lang key='homepage.makeAPayment'}</a>
            </div>
        </div>
    </div>
</section>
