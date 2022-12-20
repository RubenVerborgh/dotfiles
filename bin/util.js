module.exports = {
  replaceSafeLinks,
};

// Replaces Microsoft Safe Links by their destination
function replaceSafeLinks(source) {
  const matcher = /https:\/\/[a-z0-9.]*safelinks.protection.outlook.com\/[^\s>\]]+/g;
  return source.replace(matcher, url => {
    try {
      const parsed = new URL(url);
      url = parsed.searchParams.get('url') || url;
    }
    catch { /* ignore invalid URLs */ }
    return url;
  });
}
